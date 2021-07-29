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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '$title ：',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          child: Text(
            '  $value',
            style: TextStyle(
                color: Colors.white, fontSize: screenUtil.adaptive(20)),
          ),
        ),
      ],
    );
  }

  Widget lineWidget() {
    return Container(
      alignment: Alignment.center,
      width: screenUtil.adaptive(1),
      height: screenUtil.adaptive(15),
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black54,
        height: screenUtil.adaptive(35),
        margin: EdgeInsets.only(right: 16, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenUtil.adaptive(30),
                  width: screenUtil.adaptive(150),
                  alignment: Alignment.center,
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
                  child: headCell(title: '占用保证金', value: '0'),
                ),
                lineWidget(),
                Container(
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(20),
                      right: screenUtil.adaptive(20)),
                  child: headCell(title: '可用资金', value: '10200'),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: screenUtil.adaptive(30)),
                    child: Icon(
                      Icons.remove_red_eye,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: screenUtil.adaptive(50)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Icon(Icons.settings, size: 18,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
