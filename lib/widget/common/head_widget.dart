import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/down_menu.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class HeadWidgetPage extends StatefulWidget {
  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidgetPage> {
  List<User> users = [];
  List<String> list = ['1', '2', '3'];
  String value;

  Widget headCell({String title, String value}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '$title',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          child: Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: screenUtil.adaptive(26)),
          ),
        ),
      ],
    );
  }

  Widget lineWidget() {
    return Container(
      alignment: Alignment.topCenter,
      width: screenUtil.adaptive(3),
      height: screenUtil.adaptive(20),
      margin: EdgeInsets.only(top: screenUtil.adaptive(15)),
      color: Colors.blueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black54,
        height: screenUtil.adaptive(90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      right: screenUtil.adaptive(30),
                      left: screenUtil.adaptive(25)),
                  width: screenUtil.adaptive(200),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: screenUtil.adaptive(15), bottom: screenUtil.adaptive(10)),
                        child: Text(
                          '资金账户',
                          style: TextStyle(fontSize: screenUtil.adaptive(18)),
                        ),
                      ),
                      Container(
                        height: screenUtil.adaptive(30),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: value ?? list[0],
                              isExpanded: true,
                              items: list?.map((e) {
                                    return DropdownMenuItem(
                                        child: Text('$e'), value: e);
                                  })?.toList() ??
                                  [],
                              onChanged: (key) {
                                value = key;
                                setState(() {});
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '静态权益', value: '10020'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '平仓盈亏', value: '0'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '持仓盈亏', value: '0'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '权利金', value: '10220'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '动态权益', value: '10220'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '占用保证金', value: '0'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '可用资金', value: '10200'),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.only(
                    left: screenUtil.adaptive(25),
                    right: screenUtil.adaptive(25),
                    top: screenUtil.adaptive(8),
                    bottom: screenUtil.adaptive(8)),
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(20),
                    right: screenUtil.adaptive(20)),
                child: Text(
                  '查询',
                  style: TextStyle(
                      color: Colors.white, fontSize: screenUtil.getAutoSp(18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
