import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';
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

class DockingExamplePage extends StatefulWidget {
  @override
  _DockingExamplePageState createState() => _DockingExamplePageState();
}

class _DockingExamplePageState extends State<DockingExamplePage> {
  DockingLayout layout;
  TabbedViewTheme theme = TabbedViewTheme.minimalist();

  @override
  void initState() {
    super.initState();

    MqttHelper.init();
    int v = 1;
    layout = DockingLayout(
      root: DockingColumn([
        DockingItem(name: '实时表', widget: RealTimeListPage()),
        DockingRow([
          DockingItem(name: '标准下单表', widget: OrderSubmitPage()),
          DockingTabs([
            DockingItem(name: '所有委托单', widget: EntrustPage()),
            DockingItem(name: '未成交单', widget: UnsettledPage()),
          ]),
        ]),
        DockingRow([
          DockingTabs([
            DockingItem(name: '报价表', widget: Quotation()),
            DockingItem(name: '期权报价表', widget: OptionQuotation())
          ]),
          DockingItem(name: '持仓', widget: PositionPage()),
        ]),
      ]),
    );
  }

  DockingItem _build(int value) {
    return DockingItem(
        name: value.toString(),
        widget: Container(child: Center(child: Text('Child $value'))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Docking(layout: layout, theme: theme,), padding: EdgeInsets.all(16));
  }
}
