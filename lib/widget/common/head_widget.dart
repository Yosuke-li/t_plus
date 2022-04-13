import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';

class HeadWidgetPage extends StatefulWidget {

  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidgetPage> {
  List<User> users = [];
  List<String> list = ['1', '2', '3'];
  String? value;
  bool isHide = false;

  Widget headCell({String? title, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '$title ：',
            style: TextStyle(color: Color(0xBFFFFFFF)),
          ),
        ),
        Container(
          child: Text(
            '  ${isHide ? '*****' : value}',
            style: TextStyle(
                color: Color(0xBFFFFFFF), fontSize: 14),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenUtil.adaptive(30),
                  width: screenUtil.adaptive(150),
                  margin: EdgeInsets.only(
                      left: screenUtil.adaptive(10),
                      right: screenUtil.adaptive(20)),
                  alignment: Alignment.center,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        isExpanded: true,
                        items: list.map((e) {
                              return DropdownMenuItem(
                                  child: Text(
                                    '$e',
                                    style: TextStyle(color: Color(0xBFFFFFFF)),
                                  ),
                                  value: e);
                            }).toList(),
                        onChanged: (String? key) {
                          value = key!;
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
                  onTap: () {
                    isHide = !isHide;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: screenUtil.adaptive(30)),
                    child: Icon(
                      isHide
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      child: Icon(Icons.account_balance_wallet, size: 14,),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      child: Icon(
                        Icons.settings,
                        size: 14,
                      ),
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
