import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderPage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 700, minWidth: 600),
              child: Column(
                children: [
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10.0),
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
                              margin: EdgeInsets.only(
                                  top: screenUtil.adaptive(15),
                                  bottom: screenUtil.adaptive(10)),
                              child: Text(
                                '合约',
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
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: screenUtil.adaptive(30),
                            left: screenUtil.adaptive(25)),
                        width: screenUtil.adaptive(200),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: screenUtil.adaptive(15),
                                  bottom: screenUtil.adaptive(10)),
                              child: Text(
                                '手数',
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
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: screenUtil.adaptive(30),
                            left: screenUtil.adaptive(25)),
                        width: screenUtil.adaptive(200),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: screenUtil.adaptive(15),
                                  bottom: screenUtil.adaptive(10)),
                              child: Text(
                                '价格',
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
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.red),
                            color: Color(0x26d71345)),
                        padding: EdgeInsets.only(
                          right: screenUtil.adaptive(20),
                          left: screenUtil.adaptive(20),
                          top: screenUtil.adaptive(5),
                          bottom: screenUtil.adaptive(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(5),
                                bottom: screenUtil.adaptive(10),
                              ),
                              child: Text('19650'),
                            ),
                            Container(
                              width: screenUtil.adaptive(80),
                              height: 1.0,
                              color: Colors.red,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(10),
                                bottom: screenUtil.adaptive(5),
                              ),
                              child: Text('买多'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.green),
                            color: Color(0x2645b97c)),
                        padding: EdgeInsets.only(
                          right: screenUtil.adaptive(20),
                          left: screenUtil.adaptive(20),
                          top: screenUtil.adaptive(5),
                          bottom: screenUtil.adaptive(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(5),
                                bottom: screenUtil.adaptive(10),
                              ),
                              child: Text('19650'),
                            ),
                            Container(
                              width: screenUtil.adaptive(80),
                              height: 1.0,
                              color: Colors.green,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(10),
                                bottom: screenUtil.adaptive(5),
                              ),
                              child: Text('卖空'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.blue),
                            color: Color(0x26145b7d)),
                        padding: EdgeInsets.only(
                          right: screenUtil.adaptive(20),
                          left: screenUtil.adaptive(20),
                          top: screenUtil.adaptive(5),
                          bottom: screenUtil.adaptive(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(5),
                                bottom: screenUtil.adaptive(10),
                              ),
                              child: Text('先开先平'),
                            ),
                            Container(
                              width: screenUtil.adaptive(80),
                              height: 1.0,
                              color: Colors.blue,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: screenUtil.adaptive(10),
                                bottom: screenUtil.adaptive(5),
                              ),
                              child: Text('平仓'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text('合约名称'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
