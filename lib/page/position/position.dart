import 'package:flutter/material.dart';

import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

enum PositionType {
  Simple,
  Detail,
}

class PositionPage extends StatefulWidget {
  final PositionType type;

  PositionPage({Key? key, required this.type});

  @override
  _PositionState createState() => _PositionState();
}

class _PositionState extends State<PositionPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    users = [
      User()..username = '1'..password='1',
      User()..username = '2'..password='2',
      User()..username = '3'..password='3',
    ];
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant PositionPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {}
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
                        '品种',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.username.hashCode}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '净持仓',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: Text(
                        '买持仓',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: Text(
                        '卖持仓',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    FormColumn<User>(
                      title: Text(
                        '今买',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '今卖',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Container(
                              child: Text('${v.username ?? ''}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '最后成交价',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: Text(
                        '盯市浮盈',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '逐笔浮盈',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: Text(
                        '平仓盈亏（盯市）',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '平仓盈亏（逐笔）',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: Text(
                        '当日盈亏',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text('${v.password ?? ''}'),
                      ),
                    ),
                    FormColumn<User>(
                      title: Text(
                        '累计盈亏',
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
