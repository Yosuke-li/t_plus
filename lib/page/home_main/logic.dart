import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/utils/api_exception.dart';
import 'package:transaction_plus/utils/toast_utils.dart';

import 'state.dart';

class HomeMainLogic extends GetxController {
  final state = HomeMainState();

  @override
  void onReady() {
    super.onReady();
  }

  Future<bool> willPop() async {
    state.lastPressedAt.value++;
    if (state.lastPressedAt == null ||
        state.lastPressedAt.value < 2) {
      //两次点击间隔超过1秒则重新计时
      Timer(Duration(seconds: 1), () => state.lastPressedAt.value = 0);
      ToastUtils.showToast(msg: '再次点击退出应用 ${state.lastPressedAt.value}');
      return false;
    }
    state.lastPressedAt.value = 0;
    return true;
  }
}
