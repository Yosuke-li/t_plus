import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';
import 'package:transaction_plus/helper/cache_about/docking_cache.dart';
import 'package:transaction_plus/page/order/order_submit/view.dart';
import 'package:transaction_plus/page/real_time_list/view.dart';
import 'package:transaction_plus/utils/array_helper.dart';
import 'package:transaction_plus/utils/mqtt_helper.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common/entrustment.dart';
import 'package:transaction_plus/widget/common/option_quotation.dart';
import 'package:transaction_plus/widget/common/position.dart';
import 'package:transaction_plus/widget/common/quotation.dart';
import 'package:transaction_plus/widget/common/unsettled.dart';
import 'package:transaction_plus/widget/docking/docking.dart';
import 'package:transaction_plus/widget/docking/docking_layout.dart';

import 'disk_port.dart';

class DockingQuoPage extends StatefulWidget {
  @override
  _DockingQuoPageState createState() => _DockingQuoPageState();
}

class _DockingQuoPageState extends State<DockingQuoPage> {
  List<DockingItem> area;
  int lastSelectedTabIndex;

  @override
  void initState() {
    super.initState();
    area = [
      DockingItem(name: '自选', widget: Quotation()),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<TabData> tabs = [];
    area.forEach((child) {
      tabs.add(TabData(
          value: child,
          text: child.name != null ? child.name : '',
          closable: false,
          buttons: <TabButton>[],
          content: child.widget));
    });
    TabbedViewController controller = TabbedViewController(tabs);

    if (lastSelectedTabIndex != null &&
        lastSelectedTabIndex >= area.length &&
        area.length > 0) {
      controller.selectedIndex = area.length - 1;
    } else {
      lastSelectedTabIndex = 0;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: screenUtil.adaptive(300),
      child: TabbedView(
        controller: controller,
        contentBuilder: (BuildContext context, int index) =>
            ArrayHelper.get(area, index).widget,
        onTabSelection: (int index) {
          lastSelectedTabIndex = index;
        },
      ),
    );
  }
}
