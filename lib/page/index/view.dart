import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/widget/banner.dart';
import 'package:transaction_plus/widget/grid_component.dart';

import 'logic.dart';
import 'state.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin<IndexPage> {
  final IndexLogic logic = Get.put(IndexLogic());
  final IndexState state = Get.find<IndexLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              WidgetBanner(state.imgs.value),
              GridComponentPage(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<IndexLogic>();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
