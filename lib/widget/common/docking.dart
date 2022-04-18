import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';
import 'package:transaction_plus/helper/cache_about/docking_cache.dart';
import 'package:transaction_plus/page/order/order_submit/view.dart';
import 'package:transaction_plus/page/real_time_list/view.dart';
import 'package:transaction_plus/utils/mqtt_helper.dart';
import 'package:transaction_plus/page/entrustment/entrustment.dart';
import 'package:transaction_plus/widget/common/option_quotation.dart';
import 'package:transaction_plus/page/position/position.dart';
import 'package:transaction_plus/page/quotation/quotation.dart';
import 'package:transaction_plus/widget/common/unsettled.dart';
import 'package:transaction_plus/widget/docking/docking.dart';
import 'package:transaction_plus/widget/docking/docking_layout.dart';

import 'disk_port.dart';

class DockingExamplePage extends StatefulWidget {
  @override
  _DockingExamplePageState createState() => _DockingExamplePageState();
}

class _DockingExamplePageState extends State<DockingExamplePage>
    with AutomaticKeepAliveClientMixin {
  late DockingLayout layout;
  static const String _key = 'docking';

  @override
  void initState() {
    super.initState();

    MqttHelper.init();
    final DockingArea area = DockingColumn([
      DockingRow([
        DockingItem(name: '盘口信息[合约名称]', widget: DiskPortDetailPage(), unDragged: true, weight: 0.15),
        DockingItem(name: '标准下单表', widget: OrderSubmitPage(showTitle: false,), unDragged: true, weight: 0.28),
        DockingTabs([
          DockingItem(name: '所有委托单', widget: EntrustPage(type: EntrustType.All,), unDragged: true),
        ]),
      ], canDrag: false),
      DockingRow([
        DockingItem(name: '持仓', widget: PositionPage(type: PositionType.Simple,), weight: 0.4),
        DockingItem(name: '成交记录', widget: PositionPage(type: PositionType.Simple,)),
      ]),
    ]);

    layout = DockingLayout(root: area);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Docking(layout: layout),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
