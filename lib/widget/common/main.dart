import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common/bottom_widget.dart';
import 'package:transaction_plus/widget/common/head_widget.dart';
import 'package:transaction_plus/widget/common/docking.dart';

import 'docking_quo.dart';

class DockingMainPage extends StatefulWidget {
  @override
  _DockingMainState createState() => _DockingMainState();
}

class _DockingMainState extends State<DockingMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int currentIndex = 0;
  List<String> tabTitles;

  @override
  void initState() {
    super.initState();
    tabTitles = [
      "自选",
      "期货",
      "期权",
    ];
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          currentIndex = tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigatorUtils.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: screenUtil.adaptive(20),
                        right: screenUtil.adaptive(30)),
                    child: Image.network(
                      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
                      width: screenUtil.adaptive(50),
                      height: screenUtil.adaptive(50),
                    ),
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  controller: tabController,
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black45,
                  tabs: tabTitles.map((item) {
                    return Container(
                      padding: EdgeInsets.only(
                          top: screenUtil.adaptive(10),
                          bottom: screenUtil.adaptive(5)),
                      child: Text(
                        '$item',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Column(
                  children: [
                    DockingQuoPage(),
                    HeadWidgetPage(),
                    Expanded(child: DockingExamplePage()),
                    BottomWidgetPage(),
                  ],
                ),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
