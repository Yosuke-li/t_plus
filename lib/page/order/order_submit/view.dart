import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/helper/security_keyboard.dart';
import 'package:transaction_plus/widget/down_menu.dart';

import 'logic.dart';
import 'state.dart';

class OrderSubmitPage extends StatefulWidget {
  bool showTitle;

  OrderSubmitPage({this.showTitle});

  @override
  _OrderSubmitPageState createState() => _OrderSubmitPageState();
}

class _OrderSubmitPageState extends State<OrderSubmitPage> {
  final OrderSubmitLogic logic = Get.put(OrderSubmitLogic());
  final OrderSubmitState state = Get.find<OrderSubmitLogic>().state;

  @override
  void initState() {
    super.initState();
    state.isShowBar.value = widget.showTitle;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        appBar: state.isShowBar.value
            ? AppBar(
          title: Text('下单'),
        )
            : null,
        body: SingleChildScrollView(
          child: Form(
            key: state.formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '资金账户',
                  ),
                  onSaved: (String value) {
                    state.create.account = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '价格',
                  ),
                  onSaved: (String value) {
                    state.create.price = double.tryParse(value);
                  },
                ),
                TextFormField(
                  keyboardType: SecurityKeyboard.number,
                  decoration: InputDecoration(
                    labelText: '手数',
                  ),
                  onSaved: (String value) {
                    state.create.ordQty = int.tryParse(value);
                  },
                ),
                Container(
                  width: 300.0,
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    children: [
                      Text('方向：'),
                      Obx(
                            () => DownMenuWidget(
                          select: state.side.value,
                          menus: state.sides,
                          selectFunc: (value) {
                            state.side.value = value;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300.0,
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    children: [
                      Text('单类型：'),
                      Obx(
                            () => DownMenuWidget(
                          select: state.ordType.value,
                          menus: state.ordTypes,
                          selectFunc: (value) {
                            state.ordType.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300.0,
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    children: [
                      Text('tif：'),
                      Obx(
                            () => DownMenuWidget(
                          select: state.tif.value,
                          menus: state.tifs,
                          selectFunc: (value) {
                            state.tif.value = value;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300.0,
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    children: [
                      Text('开平标记：'),
                      Obx(
                            () => DownMenuWidget(
                          select: state.openFlag.value,
                          menus: state.openFlags,
                          selectFunc: (value) {
                            state.openFlag.value = value;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300.0,
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    children: [
                      Text('套保标记：'),
                      Obx(
                            () => DownMenuWidget(
                          select: state.hedgeFlag.value,
                          menus: state.hedgeFlags,
                          selectFunc: (value) {
                            state.hedgeFlag.value = value;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'refId',
                  ),
                  onSaved: (String value) {
                    state.create.refId = value;
                  },
                ),
                InkWell(
                  onTap: () {
                    logic.onSubmit();
                  },
                  child: Container(
                    child: Text('提交'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<OrderSubmitLogic>();
    super.dispose();
  }
}
