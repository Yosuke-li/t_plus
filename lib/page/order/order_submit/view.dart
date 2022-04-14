import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/page/order/order_modal.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common_input/text_input_lock.dart';
import 'package:transaction_plus/widget/common_input/text_input_number.dart';
import 'package:transaction_plus/widget/down_menu.dart';
import 'package:transaction_plus/widget/search_field.dart';

import 'logic.dart';
import 'state.dart';

class OrderSubmitPage extends StatefulWidget {
  bool? showTitle;

  OrderSubmitPage({this.showTitle});

  @override
  _OrderSubmitPageState createState() => _OrderSubmitPageState();
}

class _OrderSubmitPageState extends State<OrderSubmitPage> {
  final OrderSubmitLogic logic = Get.put(OrderSubmitLogic());
  final OrderSubmitState state = Get.find<OrderSubmitLogic>().state;

  final List<String> _suggestions = [
    'United States',
    'Germany',
    'Washington',
    'Paris',
    'Jakarta',
    'Australia',
    'India',
    'Czech Republic',
    'Lorem Ipsum',
  ];
  final List<String> _statesOfIndia = [
    'Andhra Pradesh',
    'Assam',
    'Arunachal Pradesh',
    'Bihar',
    'Goa',
    'Gujarat',
    'Jammu and Kashmir',
    'Jharkhand',
    'West Bengal',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Orissa',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Tripura',
    'Uttaranchal',
    'Uttar Pradesh',
    'Haryana',
    'Himachal Pradesh',
    'Chhattisgarh'
  ];

  final _searchController = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    state.isShowBar.value = widget.showTitle ?? false;
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
          controller: _controller,
          child: Container(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500, minWidth: 300),
              child: Form(
                key: state.formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: screenUtil.adaptive(30),
                        right: screenUtil.adaptive(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '合约',
                                            style: TextStyle(
                                              color: Color(0xBFffffff),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Order.Modal(context);
                                            },
                                            child: Icon(
                                              Icons.search,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          state.readOnly.value =
                                          !state.readOnly.value;
                                        },
                                        child: Icon(
                                          state.readOnly.value
                                              ? Icons.lock
                                              : Icons.lock_open,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: SearchField(
                                    suggestions: _suggestions,
                                    controller: _searchController,
                                    readOnly: state.readOnly.value,
                                    hint: '选择合约',
                                    searchAlignVertical:
                                    TextAlignVertical.bottom,
                                    initialValue: _suggestions[2],
                                    searchInputDecoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                          Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.red),
                                      ),
                                    ),
                                    maxSuggestionsInViewPort: 4,
                                    itemHeight: screenUtil.adaptive(30),
                                    onTap: (x) {
                                      print(
                                          'selected =$x ${_searchController.text}');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenUtil.adaptive(20),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    '手数',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: TextInputNumberUpDown(
                                    onSave: (String? value) {
                                      state.create.ordQty =
                                          int.tryParse(value!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: screenUtil.adaptive(30),
                        right: screenUtil.adaptive(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    '价格',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: TextInputNumberUpDown(
                                    onSave: (String? value) {
                                      state.create.ordQty =
                                          int.tryParse(value!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenUtil.adaptive(10),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    '方向',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Obx(
                                        () => DownMenuWidget<int>(
                                      select: state.side.value,
                                      menus: state.sides,
                                      selectFunc: (value) {
                                        state.side.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenUtil.adaptive(10),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    '开平',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Obx(
                                        () => DownMenuWidget<int>(
                                      select: state.openFlag.value,
                                      menus: state.openFlags,
                                      selectFunc: (value) {
                                        state.openFlag.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: screenUtil.adaptive(30),
                        right: screenUtil.adaptive(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    '投保',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Obx(
                                        () => DownMenuWidget<int>(
                                      select: state.hedgeFlag.value,
                                      menus: state.hedgeFlags,
                                      selectFunc: (value) {
                                        state.hedgeFlag.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    '类型',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Obx(
                                        () => DownMenuWidget<int>(
                                      select: state.ordType.value,
                                      menus: state.ordTypes,
                                      selectFunc: (value) {
                                        state.ordType.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: screenUtil.adaptive(15),
                                      bottom: screenUtil.adaptive(10)),
                                  child: Text(
                                    'TIF',
                                    style: TextStyle(
                                      color: Color(0xBFffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: screenUtil.adaptive(30),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xE6797979),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Obx(
                                        () => DownMenuWidget<int>(
                                      select: state.tif.value,
                                      menus: state.tifs,
                                      selectFunc: (value) {
                                        state.tif.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        logic.onSubmit();
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: screenUtil.adaptive(20),
                          top: screenUtil.adaptive(20),
                        ),
                        decoration: BoxDecoration(color: Colors.blue),
                        padding: EdgeInsets.only(
                            top: screenUtil.adaptive(5),
                            bottom: screenUtil.adaptive(5),
                            right: screenUtil.adaptive(100),
                            left: screenUtil.adaptive(100)),
                        child: Text('下单'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Color(0xE6797979),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: screenUtil.adaptive(30),
                          right: screenUtil.adaptive(30),
                          bottom: screenUtil.adaptive(5),
                          top: screenUtil.adaptive(5)),
                      child: Text('合约名称 *品种 每手x吨 保证金xxx.x元 交易所'),
                    ),
                  ],
                ),
              ),
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
