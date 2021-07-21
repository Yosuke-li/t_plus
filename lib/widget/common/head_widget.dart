import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class HeadWidgetPage extends StatefulWidget {
  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidgetPage> {
  List<User> users = [];

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
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget lineWidget() {
    return Container(
      alignment: Alignment.center,
      width: screenUtil.adaptive(3),
      height: screenUtil.adaptive(60),
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black54,
        height: screenUtil.adaptive(100),
        child: Row(
          children: [
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
              child: headCell(title: '下单冻结', value: '0'),
            ),
            lineWidget(),
            Container(
              margin: EdgeInsets.only(
                  left: screenUtil.adaptive(20),
                  right: screenUtil.adaptive(20)),
              child: headCell(title: '冻结权利金', value: '0'),
            ),
            lineWidget(),
            Container(
              margin: EdgeInsets.only(
                  left: screenUtil.adaptive(20),
                  right: screenUtil.adaptive(20)),
              child: headCell(title: '可用资金', value: '10200'),
            ),
            lineWidget(),
            Container(
              margin: EdgeInsets.only(
                  left: screenUtil.adaptive(20),
                  right: screenUtil.adaptive(20)),
              child: headCell(title: '风险度', value: '20%'),
            ),
            lineWidget(),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(20),
                    right: screenUtil.adaptive(20)),
                child: Text(
                  '查询',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
