import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/model/entrust.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

//委托单
class EntrustPage extends StatefulWidget {
  @override
  _EntrustState createState() => _EntrustState();
}

class _EntrustState extends State<EntrustPage> {
  List<Entrust> entrusts = [];

  @override
  void initState() {
    super.initState();
    entrusts = [
      Entrust()
        ..id = 0
        ..detail = '123'
        ..settled = '123'
        ..unsettled = '123'
        ..head = '123'
        ..price = '123'
        ..status = '123'
        ..buy = '123'
        ..cell = '123'
        ..open = '123',
      Entrust()
        ..id = 1
        ..detail = '456'
        ..settled = '456'
        ..unsettled = '456'
        ..head = '456'
        ..price = '456'
        ..status = '456'
        ..buy = '456'
        ..cell = '456'
        ..open = '456',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: CommonForm<Entrust>(
                columns: [
                  FormColumn<Entrust>(
                    title: '报价编号',
                    builder: (_, v) => Container(
                      child: Text('${v.id ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '合约',
                    builder: (_, v) => Container(
                      child: Text('${v.cell ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '买卖',
                    builder: (_, v) => Container(
                      child: Text('${v.buy ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '开平',
                    builder: (_, v) => Container(
                      child: Text('${v.open ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '挂单状态',
                    builder: (_, v) => Container(
                      child: Text('${v.status ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '报单价格',
                    builder: (_, v) => Container(
                      child: Text('${v.price ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '报单手数',
                    builder: (_, v) => Container(
                      child: Text('${v.head ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '未成交数',
                    builder: (_, v) => Container(
                      child: Text('${v.unsettled ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '成交手数',
                    builder: (_, v) => Container(
                      child: Text('${v.settled ?? ''}'),
                    ),
                  ),
                  FormColumn<Entrust>(
                    title: '详细状态',
                    builder: (_, v) => Container(
                      child: Text('${v.detail ?? ''}'),
                    ),
                  ),
                ],
                values: entrusts,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                CupertinoButton(
                    child: Text('撤单'),
                    onPressed: () {
                      getRandom();
                    }),
                CupertinoButton(child: Text('全撤'), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getRandom() {
    final Random ran = Random();
    final int first = ran.nextInt(entrusts.length);
    final int second = ran.nextInt(10);
    final int third = ran.nextInt(1000);

    Entrust entrust = entrusts.firstWhere((element) => element.id == first,
        orElse: () => null);
    if (entrust != null) {
      final entrustMap = entrust.toJson();
      final key = entrustMap.keys.elementAt(second);
      if (key != 'id') {
        entrustMap.update(key, (value) => third.toString());
        entrust = Entrust.fromJson(entrustMap);
      }
    }
    entrusts.removeWhere((element) => element.id == first);
    entrusts.insert(entrust.id, entrust);
    setState(() {});
  }
}
