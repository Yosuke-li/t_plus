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
      User()
        ..username = '1'
        ..accessToken = '1'
        ..password = '1',
      User()
        ..username = '2'
        ..accessToken = '-1'
        ..password = '2',
      User()
        ..username = '3'
        ..accessToken = '1'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '1'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '1'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '100'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '-10'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '89'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '70'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '-10'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '89'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '70'
        ..password = '3',
      User()
        ..username = '3'
        ..accessToken = '-10'
        ..password = '3',
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
        color: const Color(0xff323337),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CommonForm<User>(
                height: 100,
                canDrag: true,
                titleColor: const Color(0x401C1D21),
                formColor: const Color(0xff1C1D21),
                columns: [
                  FormColumn<User>(
                    title: const Text(
                      '品种',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Text(
                        '${v.username.hashCode}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  FormColumn<User>(
                    title: const Text(
                      '净持仓',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              '${v.username ?? ''}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.0,
                            child: Container(
                              color: const Color(0xff797979),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${v.accessToken ?? ''}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                                color: int.tryParse(v.accessToken!)! > 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: const Text(
                        '买持仓',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                '${v.username ?? ''}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${v.accessToken ?? ''}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  color: int.tryParse(v.accessToken!)! > 0
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: const Text(
                        '卖持仓',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                '${v.username ?? ''}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.0,
                              child: Container(
                                color: const Color(0xff797979),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${v.accessToken ?? ''}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  fontSize: 13,
                                  color: int.tryParse(v.accessToken!)! > 0
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  FormColumn<User>(
                    title: const Text(
                      '今买',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              '${v.username ?? ''}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.0,
                            child: Container(
                              color: const Color(0xff797979),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${v.accessToken ?? ''}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                                color: int.tryParse(v.accessToken!)! > 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FormColumn<User>(
                    title: const Text(
                      '今卖',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              '${v.username ?? ''}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.0,
                            child: Container(
                              color: const Color(0xff797979),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${v.accessToken ?? ''}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                                color: int.tryParse(v.accessToken!)! > 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FormColumn<User>(
                    title: const Text(
                      '最后成交价',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Text(
                        '${v.password ?? ''}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: const Text(
                        '盯市浮盈',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text(
                          '${v.password ?? ''}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  FormColumn<User>(
                    title: const Text(
                      '逐笔浮盈',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Text(
                        '${v.password ?? ''}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: const Text(
                        '平仓盈亏（盯市）',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text(
                          '${v.password ?? ''}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  FormColumn<User>(
                    title: const Text(
                      '平仓盈亏（逐笔）',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Text(
                        '${v.password ?? ''}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  if (widget.type == PositionType.Detail)
                    FormColumn<User>(
                      title: const Text(
                        '当日盈亏',
                        style: TextStyle(color: Color(0xBFffffff)),
                      ),
                      builder: (_, v) => Container(
                        child: Text(
                          '${v.password ?? ''}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  FormColumn<User>(
                    title: const Text(
                      '累计盈亏',
                      style: TextStyle(color: Color(0xBFffffff)),
                    ),
                    builder: (_, v) => Container(
                      child: Text(
                        '${v.accessToken ?? ''}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          color: int.tryParse(v.accessToken!)! > 0
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
                values: users,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
