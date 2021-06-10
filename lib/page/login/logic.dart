import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/model/login.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/page/home_main/view.dart';
import 'package:transaction_plus/page/management/home_page.dart';
import 'package:transaction_plus/utils/dio/dio_helper.dart';
import 'package:transaction_plus/utils/mqtt_helper.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/store.dart';
import 'package:transaction_plus/utils/toast_utils.dart';
import 'package:transaction_plus/widget/api_call_back.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final state = LoginState();

  @override
  void onReady() {
    onGetServer();
    LocateStorage.init().whenComplete(() => _checkStore());
    super.onReady();
  }

  void _checkStore() {
    final String value = LocateStorage.getStringWithExpire('User');
    User user = User.fromJson(jsonDecode(value));
    state.isRead.value = user.isRead;
    state.name.value = user.username;
    state.nameController.text = user.username;
    state.password.value = user.password;
    state.passController.text = user.password;
  }

  Future<void> onGetServer() async {
    await rootBundle.loadString('assets/data/server.json').then((String value) {
      List list = json.decode(value);
      list.forEach((element) {
        state.servers.add(element['server']);
      });
      state.server.value = state.servers[0];
    });
  }

  void login() async {
    final FormState from = state.formKey.currentState;
    from.save();
    if (from.validate()) {
      bool c = _check();
      if (c == true) {
        try {
          final res = await loadingCallback(
            () => Request.login(params: {
              'username': state.name.value,
              'password': state.password.value
            }),
          );

          String cookie = res.headers.map['set-cookie'].toString().substring(
              1, res.headers.map['set-cookie'].toString().length - 1);
          print(cookie);

          final LoginModel loginModel =
              LoginModel.fromJson(json.decode(res.data));
          if (loginModel != null && loginModel.code == 0) {
            User user = User(
                username: state.name.value,
                password: state.password.value,
                isRead: true,
                accessToken: '');
            Global.user = user;
            LocateStorage.setStringWithExpire(
                'User', jsonEncode(user), Duration(days: 7));
            LocateStorage.setString('cookie', cookie);
            //check mqtt client
            MqttHelper.init();
            if (Platform.isAndroid || Platform.isIOS) {
              NavigatorUtils.pushWidget(Get.context, HomeMainPage());
            } else if (Platform.isWindows || Platform.isMacOS) {
              NavigatorUtils.pushWidget(Get.context, ManagePage());
            }
          } else if (loginModel != null && loginModel.code == 10002) {
            ToastUtils.showToast(msg: '用户名或密码不正确');
            return;
          } else {
            ToastUtils.showToast(msg: '内部异常');
            return;
          }
        } catch (error) {
          print(error);
          rethrow;
        }
      }
    }
  }

  bool _check() {
    String errText;
    if (state.password.value == null || state.password.value.isEmpty == true) {
      errText = '密码不能为空';
    }
    if (state.name.value == null || state.name.value.isEmpty == true) {
      errText = '账户不能为空';
    }
    if (state.isRead.value != true) {
      errText = '请先同意协议';
    }

    if (errText != null) {
      ToastUtils.showToast(msg: errText);
      return false;
    }

    return true;
  }
}
