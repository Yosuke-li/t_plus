import 'package:flutter/material.dart';

import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/page/order_history/order_history.dart';
import 'package:transaction_plus/page/order_history/order_modal.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common/bottom_widget.dart';
import 'package:transaction_plus/page/account/head_widget.dart';
import 'package:transaction_plus/page/quotation/quotation.dart';

import '../../page/order/order_submit/view.dart';
import 'disk_port.dart';
import '../../page/entrustment/entrustment.dart';
import '../../page/position/position.dart';

class DockingMainPage extends StatefulWidget {
  @override
  _DockingMainState createState() => _DockingMainState();
}

class _DockingMainState extends State<DockingMainPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  EntrustType type = EntrustType.All;
  DiskPortType diskType = DiskPortType.TypeOne;
  PositionType positionType = PositionType.Simple;

  /// widget list
  Widget EntrustWidget = const EntrustPage(type: EntrustType.All);
  Widget PositionWidget = const PositionPage(type: PositionType.Simple);

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
          // Container(
          //   child: Row(
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           EventBusHelper.asyncStreamController
          //               !.add(EventCache()..isDarkTheme = false);
          //           NavigatorUtils.pop(context);
          //         },
          //         child: Container(
          //           margin: EdgeInsets.only(
          //               left: screenUtil.adaptive(20),
          //               right: screenUtil.adaptive(30)),
          //           child: Image.network(
          //             'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
          //             width: screenUtil.adaptive(50),
          //             height: screenUtil.adaptive(50),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      right: screenUtil.adaptive(10),
                                      left: screenUtil.adaptive(10),
                                      top: screenUtil.adaptive(3),
                                      bottom: screenUtil.adaptive(3),
                                    ),
                                    color: const Color(0xff7C7F80),
                                    child: const Text(
                                      '报价表',
                                    ),
                                  )
                                ],
                              )),
                          const QuotationPage(),
                        ],
                      ),
                    ),
                  ),
                ),
                const HeadWidgetPage(),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            right: screenUtil.adaptive(10),
                                            left: screenUtil.adaptive(8),
                                            top: screenUtil.adaptive(3),
                                            bottom: screenUtil.adaptive(3),
                                          ),
                                          child: const Text(
                                            '盘口信息[合约]',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            diskType =
                                                diskType == DiskPortType.TypeOne
                                                    ? DiskPortType.TypeTwo
                                                    : DiskPortType.TypeOne;
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: screenUtil.adaptive(8)),
                                            child: const Icon(
                                              Icons.switch_left,
                                              size: 16,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: RepaintBoundary(
                                      child: DiskPortDetailPage(
                                        type: diskType,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                right: screenUtil.adaptive(10),
                                                left: screenUtil.adaptive(10),
                                                top: screenUtil.adaptive(3),
                                                bottom: screenUtil.adaptive(3),
                                              ),
                                              color: const Color(0xff7C7F80),
                                              child: const Text(
                                                '标准下单板',
                                              ),
                                            )
                                          ],
                                        )),
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
                                color: const Color(0xff797979),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            right: screenUtil.adaptive(10),
                                            left: screenUtil.adaptive(10),
                                            top: screenUtil.adaptive(3),
                                            bottom: screenUtil.adaptive(3),
                                          ),
                                          color: const Color(0xff7C7F80),
                                          child: const Text(
                                            '委托',
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.8,
                                                      child: Checkbox(
                                                        activeColor:
                                                            const Color(0xcc4285F4),
                                                        value: type ==
                                                            EntrustType.All,
                                                        onChanged:
                                                            (bool? value) {
                                                          type =
                                                              EntrustType.All;
                                                          EntrustWidget = EntrustPage(type: type);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    const Text('全部'),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.8,
                                                      child: Checkbox(
                                                        activeColor:
                                                            const Color(0xcc4285F4),
                                                        value: type ==
                                                                EntrustType
                                                                    .Order,
                                                        onChanged:
                                                            (bool? value) {
                                                          type =
                                                              EntrustType.Order;
                                                          EntrustWidget = EntrustPage(type: type);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    const Text('挂单'),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.8,
                                                      child: Checkbox(
                                                        activeColor:
                                                            const Color(0xcc4285F4),
                                                        value: type ==
                                                                EntrustType
                                                                    .Finish,
                                                        onChanged:
                                                            (bool? value) {
                                                          type = EntrustType
                                                              .Finish;
                                                          EntrustWidget = EntrustPage(type: type);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    const Text('成交'),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.8,
                                                      child: Checkbox(
                                                        activeColor:
                                                            const Color(0xcc4285F4),
                                                        value: type ==
                                                                EntrustType
                                                                    .Delete,
                                                        onChanged:
                                                            (bool? value) {
                                                          type = EntrustType
                                                              .Delete;
                                                          EntrustWidget = EntrustPage(type: type);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    const Text('已撤/废单'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: RepaintBoundary(
                                      child: EntrustWidget,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xff000000),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: RepaintBoundary(
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                positionType =
                                                    PositionType.Simple;
                                                PositionWidget = PositionPage(type: positionType);
                                                setState(() {});
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  right:
                                                      screenUtil.adaptive(10),
                                                  left: screenUtil.adaptive(10),
                                                  top: screenUtil.adaptive(3),
                                                  bottom:
                                                      screenUtil.adaptive(3),
                                                ),
                                                color: positionType ==
                                                        PositionType.Simple
                                                    ? const Color(0xff7C7F80)
                                                    : null,
                                                child: const Text(
                                                  '持仓',
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                positionType =
                                                    PositionType.Detail;
                                                PositionWidget = PositionPage(type: positionType);
                                                setState(() {});
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  right:
                                                      screenUtil.adaptive(10),
                                                  left: screenUtil.adaptive(10),
                                                  top: screenUtil.adaptive(3),
                                                  bottom:
                                                      screenUtil.adaptive(3),
                                                ),
                                                color: positionType ==
                                                        PositionType.Detail
                                                    ? const Color(0xff7C7F80)
                                                    : null,
                                                child: const Text(
                                                  '详细持仓',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: RepaintBoundary(
                                        child: PositionWidget,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.5,
                                child: Container(
                                  color: Colors.black12,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                right: screenUtil.adaptive(10),
                                                left: screenUtil.adaptive(10),
                                                top: screenUtil.adaptive(3),
                                                bottom: screenUtil.adaptive(3),
                                              ),
                                              color: const Color(0xff7C7F80),
                                              child: const Text(
                                                '成交记录',
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                OrderHModal.Modal(context);
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.only(right: 10),
                                                child: const Text('查看更多'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: OrderHistory(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const BottomWidgetPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
