import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/model/order_submit.dart';

class OrderSubmitState {
  GlobalKey<FormState> formKey;
  OrderSubmit create;

  RxInt side;
  RxInt tif;
  RxInt ordType;
  RxInt openFlag;
  RxInt hedgeFlag;

  List<int> sides;
  List<int> tifs;
  List<int> ordTypes;
  List<int> openFlags;
  List<int> hedgeFlags;

  OrderSubmitState() {
    formKey = GlobalKey<FormState>();
    create = OrderSubmit();
    sides = <int>[];
    tifs = <int>[];
    ordTypes = <int>[];
    openFlags = <int>[];
    hedgeFlags = <int>[];
    side = 0.obs;
    tif = 0.obs;
    ordType = 0.obs;
    openFlag = 0.obs;
    hedgeFlag = 0.obs;
  }
}
