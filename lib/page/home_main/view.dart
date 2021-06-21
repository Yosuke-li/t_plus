import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/global/dll_text.dart';
import 'package:transaction_plus/page/index/view.dart';
import 'package:transaction_plus/page/my/view.dart';
import 'package:transaction_plus/page/real_time_list/view.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/toast_utils.dart';

import 'logic.dart';
import 'state.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage>
    with SingleTickerProviderStateMixin<HomeMainPage> {
  final HomeMainLogic logic = Get.put(HomeMainLogic());
  final HomeMainState state = Get.find<HomeMainLogic>().state;

  @override
  void initState() {
    state.tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        state.currentIndex.value = state.tabController.index;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: TabBarView(controller: state.tabController, children: [
            IndexPage(),
            RealTimeListPage(),
            MyPage(),
          ]),
          bottomNavigationBar: Obx(
                () => BottomNavigationBar(
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: '首页'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt), label: '实时列表'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: '我的'),
              ],
              currentIndex: state.currentIndex.value,
              onTap: (index) {
                state.currentIndex.value = index;
                state.tabController.animateTo(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ),
        ),
        onWillPop: () async {
          if (state.lastPressedAt == null ||
              state.lastPressedAt.value != 3) {
            //两次点击间隔超过1秒则重新计时
            Timer(Duration(seconds: 1), () => state.lastPressedAt++);
            ToastUtils.showToast(msg: '再次点击退出应用');
            return false;
          }
          state.lastPressedAt.value = 0;
          return true;
        });
  }

  @override
  void dispose() {
    Get.delete<HomeMainLogic>();
    super.dispose();
  }
}
