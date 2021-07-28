import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';
import 'package:transaction_plus/helper/cache_about/docking_cache.dart';
import 'package:transaction_plus/page/order/order_submit/view.dart';
import 'package:transaction_plus/page/real_time_list/view.dart';
import 'package:transaction_plus/utils/mqtt_helper.dart';
import 'package:transaction_plus/widget/common/entrustment.dart';
import 'package:transaction_plus/widget/common/option_quotation.dart';
import 'package:transaction_plus/widget/common/position.dart';
import 'package:transaction_plus/widget/common/quotation.dart';
import 'package:transaction_plus/widget/common/unsettled.dart';
import 'package:transaction_plus/widget/docking/docking.dart';
import 'package:transaction_plus/widget/docking/docking_layout.dart';

import 'order.dart';

class DockingExamplePage extends StatefulWidget {
  @override
  _DockingExamplePageState createState() => _DockingExamplePageState();
}

class _DockingExamplePageState extends State<DockingExamplePage>
    with AutomaticKeepAliveClientMixin {
  DockingLayout layout;
  static const String _key = 'docking';
  TabbedViewTheme theme = TabbedViewTheme.dark();

  @override
  void initState() {
    super.initState();

    MqttHelper.init();
    final DockingArea area = DockingColumn([
      DockingTabs([
        DockingItem(name: '报价表', widget: Quotation()),
        DockingItem(name: '期权报价表', widget: OptionQuotation())
      ]),
      DockingRow([
        DockingItem(name: '标准下单表', widget: OrderPage(), unDragged: true),
        DockingTabs([
          DockingItem(name: '所有委托单', widget: EntrustPage(), unDragged: true),
          DockingItem(name: '未成交单', widget: UnsettledPage()),
        ]),
      ]),
      DockingRow([
        DockingItem(name: '持仓', widget: PositionPage()),
        DockingItem(name: '成交记录', widget: PositionPage()),
      ]),
    ]);

    final List<List<int>> i = [
      [1],
      [2, 3],
      [],
      []
    ];

    if (area is DockingColumn) {
      print(area);
    } else if (area is DockingRow) {
    } else if (area is DockingItem) {
    } else if (area is DockingTabs) {}

    layout = DockingLayout(root: area);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Docking(layout: layout, theme: theme),
      padding: EdgeInsets.all(16),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
