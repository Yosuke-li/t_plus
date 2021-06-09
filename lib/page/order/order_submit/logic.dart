import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/utils/dio/dio_helper.dart';

import 'state.dart';

class OrderSubmitLogic extends GetxController {
  final state = OrderSubmitState();

  @override
  void onReady() {
    _setData();
    super.onReady();
  }

  void _setData() {
    state.sides = [1, 2];
    state.tifs = [1, 2, 3];
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
    final FormState from = state.formKey.currentState;
    from.save();
    if (from.validate()) {

      try {
        final res = await Request.post('/fospot/api/order/new', data: {
          'username': Global.user.username,
          'price': state.create.price,
          'ordQty': state.create.ordQty,
          'side': state.side.value,
          'ordType': state.ordType.value,
          'tif': state.tif.value,
          'refId': state.create.refId,
          'account': state.create.account,
          'openFlag': state.openFlag.value,
          'hedgeFlag': state.hedgeFlag.value,
        });
        print(res);
      } catch (error, stack) {
        print(error);
        rethrow;
      }
    }
  }
}
