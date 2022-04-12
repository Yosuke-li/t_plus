import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMainState {
  late TabController tabController;
  late RxInt currentIndex;
  late RxInt lastPressedAt; //上次点击时间

  HomeMainState() {
    currentIndex = 0.obs;
    lastPressedAt = 0.obs;
  }
}
