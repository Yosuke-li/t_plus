import 'dart:math';

import 'package:flutter/material.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:transaction_plus/model/entrust.dart';
import 'package:transaction_plus/page/entrustment/page/change_order.dart';
import 'package:transaction_plus/page/entrustment/page/delete_order.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';
import 'package:transaction_plus/widget/modal_utils.dart';

import 'entrust_modal.dart';

enum EntrustType {
  All,
  Delete,
  Order,
  Finish,
}

//委托单
class EntrustPage extends StatefulWidget {
  final EntrustType type;

  EntrustPage({required this.type});

  @override
  _EntrustState createState() => _EntrustState();
}

class _EntrustState extends State<EntrustPage> {
  List<Entrust> entrusts = [];
  late RightMenuFunc _rightMenuFunc;

  @override
  void initState() {
    init();
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

  void init() {
    Log.info('init: ${widget.type}');
    _rightMenuFunc = RightMenuFunc()
      ..onItemSelected = (MenuItem item, int index) {
        Log.info('index: $index');
        item.onSelected?.call();
      }
      ..menuItems = [
        MenuItem(
          title: '改单',
          onSelected: () async {
            final bool? reBack = await EntrustModal.Modal(context,
                child: ChangeOrder(),
                title: '编辑改单',
                size: ModalSize(width: 445, height: 310));
          },
        ),
        MenuItem(
          title: '撤单',
          onSelected: () async {
            final bool? reBack = await EntrustModal.Modal(
              context,
              child: DeleteOrder(),
              title: '操作确认',
              size: ModalSize(width: 400, height: 210),
            );
          },
        ),
        MenuItem(
          title: '全撤',
          onSelected: () async {
            final bool? reBack = await EntrustModal.Modal(context,
                child: Container(), title: '操作确认');
          },
        ),
      ];
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant EntrustPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      Log.info('didUpdateWidget: ${widget.type}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: const Color(0xff323337),
        child: CommonForm<Entrust>(
          canDrag: true,
          titleColor: const Color(0x401C1D21),
          formColor: const Color(0xff1C1D21),
          height: 200,
          rightMenuFunc: _rightMenuFunc,
          columns: [
            FormColumn<Entrust>(
              title: const Text(
                '报价编号',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.id ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '合约',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.cell ?? ''}',
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '买卖',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.buy ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '开平',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.open ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '挂单状态',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.status ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '报单价格',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.price ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '报单手数',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.head ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '未成交数',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.unsettled ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '成交手数',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.settled ?? ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FormColumn<Entrust>(
              title: const Text(
                '详细状态',
                style: TextStyle(color: Color(0xBFffffff)),
              ),
              builder: (_, v) => Container(
                child: Text(
                  '${v.detail ?? ''}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
          values: entrusts,
        ),
      ),
    );
  }

  void getRandom() {
    final Random ran = Random();
    final int first = ran.nextInt(entrusts.length);
    final int second = ran.nextInt(10);
    final int third = ran.nextInt(1000);

    Entrust entrust = entrusts.firstWhere(
      (element) => element.id == first,
    );
    if (entrust != null) {
      final entrustMap = entrust.toJson();
      final key = entrustMap.keys.elementAt(second);
      if (key != 'id') {
        entrustMap.update(key, (value) => third.toString());
        entrust = Entrust.fromJson(entrustMap);
      }
    }
    entrusts.removeWhere((element) => element.id == first);
    entrusts.insert(entrust.id!, entrust);
    setState(() {});
  }
}
