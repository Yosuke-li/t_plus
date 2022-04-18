import 'package:flutter/material.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    users = [
      User()
        ..accessToken = '买'
        ..password = '1'
        ..username = '1',
      User()
        ..accessToken = '卖'
        ..password = '2'
        ..username = '2',
      User()
        ..accessToken = '买'
        ..password = '3'
        ..username = '3',
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Color(0xff000000),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CommonForm<User>(
                  height: 100,
                  columns: [
                    FormColumn<User>(
                      title: Text(
                        '合约',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.username.hashCode}'),
                      ),
                    ),
                    FormColumn<User>(
                      width: 60,
                      title: Text(
                        '方向',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text(
                          '${v.accessToken}',
                          style: TextStyle(
                            color: v.accessToken == '买'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '开平标志',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.username.hashCode}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '成交手数',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.username.hashCode}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '成交价格',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '投保标志',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '报单编号',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '交易员',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '成交时间（本地时间）',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                  ],
                  values: users,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
