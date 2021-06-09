import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMainState {
  TabController tabController;
  RxInt currentIndex;
  RxInt lastPressedAt; //上次点击时间

  HomeMainState() {
    currentIndex = 0.obs;
    lastPressedAt = 0.obs;
  }
}
