import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/global/api.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/utils/dio/dio_helper.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/toast_utils.dart';

import 'state.dart';

class OrderSubmitLogic extends GetxController {
  final state = OrderSubmitState();

  @override
  void onReady() {
    if (Platform.isWindows || Platform.isMacOS) {
      state.isShowBar.value = false;
    }
    _setData();
    super.onReady();
  }

  void _setData() {
    state.sides = [1, 2];
    state.tifs = [1, 2, 3, 6, 5,45,45,4,45,454,54,5,4,54,5,4,54,5,4,5,4,5,4,4,5,4];
    state.ordTypes = [1, 2, 3, 4];
    state.openFlags = [1, 2, 3, 4, 5];
    state.hedgeFlags = [1, 2, 3, 4, 5];
    state.hedgeFlag.value =state.hedgeFlags[0];
    state.side.value =state.sides[0];
    state.tif.value =state.tifs[0];
    state.ordType.value =state.ordTypes[0];
    state.openFlag.value =state.openFlags[0];
  }

  //提交
  void onSubmit() async {
    final FormState? from = state.formKey.currentState;
    from!.save();
    if (from.validate()) {

      try {
        final res = await Request.post(ApiCenter.order, data: {
          'username': Global.user?.username,
          'price': state.create.price,
          'ordQty': state.create.ordQty,
          'rawSide': state.side.value,
          'rawOrdType': state.ordType.value,
          'rawTif': state.tif.value,
          'refId': state.create.refId,
          'account': state.create.account,
          'rawOpenFlag': state.openFlag.value,
          'rawHedgeFlag': state.hedgeFlag.value,
        });
        Log.info(res);
        ToastUtils.showToast(msg: '${res.data}');
      } catch (error, stack) {
        Log.error(error, stackTrace: stack);
        rethrow;
      }
    }
  }
}
