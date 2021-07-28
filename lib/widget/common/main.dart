import 'package:flutter/material.dart';
import 'package:transaction_plus/widget/common/app_bar.dart';
import 'package:transaction_plus/widget/common/bottom_widget.dart';
import 'package:transaction_plus/widget/common/head_widget.dart';
import 'package:transaction_plus/widget/common/quotation.dart';
import 'package:transaction_plus/widget/common/docking.dart';

class DockingMainPage extends StatefulWidget {
  @override
  _DockingMainState createState() => _DockingMainState();
}

class _DockingMainState extends State<DockingMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPage(),
          HeadWidgetPage(),
          Expanded(child: DockingExamplePage()),
          BottomWidgetPage(),
        ],
      ),
    );
  }
}
