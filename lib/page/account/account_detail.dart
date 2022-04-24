import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/drop_menu/overlay_field.dart';

import 'account_modal.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  // init data
  late String account;
  final List<String> accounts = ['1', '2'];
  List<String> groups = ['123', '456'];

  @override
  void initState() {
    super.initState();
    account = accounts.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        child: Row(
                          children: [
                            Container(
                              child: const Text('账户：'),
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                child: OverlayField<String>(
                                  initValue: account,
                                  child: (String item) {
                                    return Text(item);
                                  },
                                  lists: accounts,
                                  onChange: (String value) {
                                    account = value;
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
                        width: 160,
                        child: Row(
                          children: [
                            Container(
                              child: const Text('账户名称：'),
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                child: OverlayField<String>(
                                  initValue: account,
                                  child: (String item) {
                                    return Text(item);
                                  },
                                  lists: accounts,
                                  onChange: (String value) {
                                    account = value;
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
                        width: 160,
                        child: Row(
                          children: [
                            Container(
                              child: const Text('代表货币：'),
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                child: OverlayField<String>(
                                  initValue: account,
                                  child: (String item) {
                                    return Text(item);
                                  },
                                  lists: accounts,
                                  onChange: (String value) {
                                    account = value;
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
                        width: 160,
                        child: Row(
                          children: [
                            Container(
                              child: const Text('币种组：'),
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                child: OverlayField<String>(
                                  initValue: account,
                                  child: (String item) {
                                    return Text(item);
                                  },
                                  lists: accounts,
                                  onChange: (String value) {
                                    account = value;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('查询'),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 15,
                ),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text('key'),
                        ),
                        Container(
                          child: Text('value'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('资金栏相关展示数据 [代表货币：USD(Base)，币种组：All]'),
                ElevatedButton(
                  onPressed: () async {
                    final bool? refresh = await Account.DataModal(context);
                  },
                  child: Text('设置'),
                )
              ],
            ),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 20, bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff797979),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: groups
                  .map(
                    (e) => Draggable<String>(
                  child: DragTarget<String>(
                    onAccept: (o) {
                      int from = groups.indexOf(o);
                      int to = groups.indexOf(e);
                      final temp = groups[from];
                      groups[from] = groups[to];
                      groups[to] = temp;
                      setState(() {});
                    },
                    builder: (context, _, __) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 35,
                          height: 20,
                          margin: EdgeInsets.all(screenUtil.adaptive(10)),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                                style: BorderStyle.solid),
                          ),
                          child: Text(e, textAlign: TextAlign.center),
                        ),
                      );
                    },
                  ),
                  data: e,
                  feedback: Container(
                    width: 35,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('提示：按住单个字段拖动进行排序', style: TextStyle(fontSize: 12),),
          ),
        ],
      ),
    );
  }
}
