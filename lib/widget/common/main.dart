import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common/bottom_widget.dart';
import 'package:transaction_plus/widget/common/head_widget.dart';
import 'package:transaction_plus/page/quotation/quotation.dart';

import '../../page/order/order_submit/view.dart';
import 'disk_port.dart';
import 'entrustment.dart';
import 'position.dart';

class DockingMainPage extends StatefulWidget {
  @override
  _DockingMainState createState() => _DockingMainState();
}

class _DockingMainState extends State<DockingMainPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    EventBusHelper.asyncStreamController!.add(EventCache()..isDarkTheme = true);
  }

  @override
  void dispose() {
    super.dispose();
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
                    EventBusHelper.asyncStreamController
                        !.add(EventCache()..isDarkTheme = false);
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
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              right: screenUtil.adaptive(10),
                              left: screenUtil.adaptive(10),
                              top: screenUtil.adaptive(3),
                              bottom: screenUtil.adaptive(3),
                            ),
                            child: Text('报价表'),
                          ),
                          Quotation(),
                        ],
                      ),
                    ),
                  ),
                ),
                HeadWidgetPage(),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(
                                      right: screenUtil.adaptive(10),
                                      left: screenUtil.adaptive(10),
                                      top: screenUtil.adaptive(3),
                                      bottom: screenUtil.adaptive(3),
                                    ),
                                    child: Text('盘口信息'),
                                  ),
                                  Expanded(child: DiskPortDetailPage()),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              child: Container(
                                color: Color(0xff797979),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                        right: screenUtil.adaptive(10),
                                        left: screenUtil.adaptive(10),
                                        top: screenUtil.adaptive(3),
                                        bottom: screenUtil.adaptive(3),
                                      ),
                                      child: Text('标准下单板'),
                                    ),
                                    Expanded(
                                      child: OrderSubmitPage(
                                        showTitle: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              child: Container(
                                color: Color(0xff797979),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(
                                      right: screenUtil.adaptive(10),
                                      left: screenUtil.adaptive(10),
                                      top: screenUtil.adaptive(3),
                                      bottom: screenUtil.adaptive(3),
                                    ),
                                    child: Text('委托'),
                                  ),
                                  EntrustPage(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: PositionPage(),
                            ),
                            SizedBox(
                              width: 1,
                              child: Container(
                                color: Colors.black12,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: PositionPage(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BottomWidgetPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
