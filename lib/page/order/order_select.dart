import 'package:flutter/material.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/widget/group_list.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class OrderSelect extends StatefulWidget {
  const OrderSelect({Key? key}) : super(key: key);

  @override
  State<OrderSelect> createState() => _OrderSelectState();
}

class _OrderSelectState extends State<OrderSelect> {
  late List<GroupListModel<String>> data;
  List<User> exchanges = <User>[];
  User? _user;

  @override
  void initState() {
    data = [
      GroupListModel<String>()
        ..title = 'GTS-XLA'
        ..children = ['1', '2', '3'],
      GroupListModel<String>()
        ..title = 'GTS-XLA'
        ..children = ['1', '2', '3'],
      GroupListModel<String>()
        ..title = 'GTS-XLA'
        ..children = ['1', '2', '3'],
    ];
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text('市场/品种'),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(border: Border.all()),
                            child: SingleChildScrollView(
                              child: GroupListWidget<String>(
                                padding: const EdgeInsets.all(0),
                                list: data,
                                groupItemBuilder: (String value) {
                                  return InkWell(
                                    onTap: () {
                                      Log.info(value);
                                      if (exchanges.indexWhere((element) =>
                                              element.username == value) <
                                          0) {
                                        exchanges.add(
                                          User()
                                            ..username = value
                                            ..password = value,
                                        );
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Text('$value'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: const Text('合约'),
                          ),
                          Expanded(
                            child: Container(
                              child: CommonForm<User>(
                                height: 200,
                                onTapFunc: (User value) {
                                  Log.info('${value.username}');
                                  _user = value;
                                  setState(() {});
                                },
                                columns: [
                                  FormColumn<User>(
                                    title: Text(
                                      '交易代码',
                                      style:
                                          TextStyle(color: Color(0xBFffffff)),
                                    ),
                                    color: (v) {
                                      return _user == v ? Colors.blueAccent : null;
                                    },
                                    builder: (_, v) => Container(
                                      child: Text('${v.username ?? ''}'),
                                    ),
                                  ),
                                  FormColumn<User>(
                                    title: Text(
                                      '默认下单手数',
                                      style:
                                          TextStyle(color: Color(0xBFffffff)),
                                    ),
                                    color: (v) {
                                      return _user == v ? Colors.blueAccent : null;
                                    },
                                    builder: (_, v) => Container(
                                      child: Text('${v.username ?? ''}'),
                                    ),
                                  ),
                                  FormColumn<User>(
                                    title: Text(
                                      '交易代码',
                                      style:
                                          TextStyle(color: Color(0xBFffffff)),
                                    ),
                                    color: (v) {
                                      return _user == v ? Colors.blueAccent : null;
                                    },
                                    builder: (_, v) => Container(
                                      child: Text('${v.password ?? ''}'),
                                    ),
                                  ),
                                ],
                                values: exchanges,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('市场/品种'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff797979),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('合约名称　每手吨 交易所'),
                      ),
                      Container(
                        child: Text('报价单位：元（人民币）/吨'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          NavigatorUtils.pop(context, results: true);
                        },
                        child: Text('确定'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          NavigatorUtils.pop(context);
                        },
                        child: Text('取消'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
