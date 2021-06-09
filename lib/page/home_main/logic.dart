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

  }
}
