import 'package:flutter/material.dart';

import 'package:transaction_plus/utils/datetime_utils.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/widget/drop_menu/overlay_calendar.dart';

import 'package:transaction_plus/widget/drop_menu/overlay_field.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

import '../../model/user.dart';
import 'ex_utils.dart';

class OrderHistoryMore extends StatefulWidget {
  const OrderHistoryMore({Key? key}) : super(key: key);

  @override
  State<OrderHistoryMore> createState() => _OrderHistoryMoreState();
}

class _OrderHistoryMoreState extends State<OrderHistoryMore>{
  List<SearchType> types = [SearchType.Date, SearchType.Day];
  SearchType _type = SearchType.Day;

  List<User> users = [];
  List<int> timeRange = <int>[];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    timeRange = [
      (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
      (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
    ];
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
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    child: Row(
                      children: [
                        Container(
                          child: const Text('账户：'),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            child: OverlayField<String>(
                              lists: [],
                              child: (String value) => Text('$value'),
                              initValue: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      children: [
                        Container(
                          child: const Text('查询类型：'),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            child: OverlayField<String>(
                              lists: types.map((e) => e.enumToString).toList(),
                              child: (String value) => Text('$value'),
                              textStyle: const TextStyle(fontSize: 13),
                              initValue: '${_type.enumToString}',
                              onChange: (String value) {
                                _type = value.stringToSearchType;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      children: [
                        const Text('开始时间: '),
                        Expanded(
                          child: Container(
                            height: 30,
                            child: OverlayCalendar(
                              initValue:
                                  '${DateTimeHelper.datetimeFormat(timeRange[0], 'yyyy-MM-dd')}',
                              textStyle: const TextStyle(fontSize: 13),
                              onChange: (value) {
                                Log.info((value.value as DateTime)
                                    .millisecondsSinceEpoch);
                                timeRange[0] = ((value.value as DateTime)
                                            .millisecondsSinceEpoch /
                                        1000)
                                    .floor();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      children: [
                        const Text('结束时间: '),
                        Expanded(
                          child: Container(
                            height: 30,
                            child: OverlayCalendar(
                              initValue:
                                  '${DateTimeHelper.datetimeFormat(timeRange[1], 'yyyy-MM-dd')}',
                              textStyle: const TextStyle(fontSize: 13),
                              onChange: (value) {
                                timeRange[1] = ((value.value as DateTime)
                                            .millisecondsSinceEpoch /
                                        1000)
                                    .floor();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 2, left: 8, right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: const Text('昨天', textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 2, left: 8, right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: const Text('近三天', textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 2, left: 8, right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: const Text('近一周', textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      child: const Text('查询'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CommonForm<User>(
              height: 100,
              titleColor: const Color(0x401C1D21),
              formColor: const Color(0xff1C1D21),
              columns: [
                FormColumn<User>(
                  title: const Text(
                    '合约',
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
                  width: 60,
                  title: const Text(
                    '方向',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text(
                      '${v.accessToken}',
                      style: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                        color: v.accessToken == '买' ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
                FormColumn<User>(
                  title: const Text(
                    '开平标志',
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
                    '成交手数',
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
                    '成交价格',
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
                    '投保标志',
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
                    '报单编号',
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
                    '交易员',
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
                    '成交时间（本地时间）',
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
              ],
              values: users,
            ),
          ),
        ],
      ),
    );
  }
}
