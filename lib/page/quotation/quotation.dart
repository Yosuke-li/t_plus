import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:native_context_menu/native_context_menu.dart' as native;
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/page/quotation/setting.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class QuotationPage extends StatefulWidget {
  const QuotationPage({Key? key}) : super(key: key);

  @override
  _QuotationState createState() => _QuotationState();
}

class _QuotationState extends State<QuotationPage> {
  List<User> users = [
    User()
      ..username = '1'
      ..password = '564',
    User()
      ..username = '2'
      ..password = '564',
    User()
      ..username = '3'
      ..password = '4',
    User()
      ..username = '5'
      ..password = '564',
    User()
      ..username = '6'
      ..password = '564',
    User()
      ..username = '7'
      ..password = '564',
    User()
      ..username = '8'
      ..password = '564',
    User()
      ..username = '9'
      ..password = '564',
    User()
      ..username = '10'
      ..password = '564',
    User()
      ..username = '11'
      ..password = '564',
    User()
      ..username = '12'
      ..password = '564',
    User()
      ..username = '13'
      ..password = '564',
    User()
      ..username = '14'
      ..password = '564',
    User()
      ..username = '15'
      ..password = '564',
    User()
      ..username = '16'
      ..password = '564',
    User()
      ..username = '17'
      ..password = '564',
    User()
      ..username = '18'
      ..password = '564',
  ];

  List<String> groups = ['123', '456'];
  String select_group = '123';
  late RightMenuFunc _rightMenuFunc;
  bool canDrag = true;

  @override
  void initState() {
    _init(); // late要在初始化之前
    super.initState();
  }

  //右键菜单栏
  void _init() {
    _rightMenuFunc = RightMenuFunc()
      ..onItemSelected = (native.MenuItem item, int index) {
        Log.info('index: $index');
        item.onSelected?.call();
      }
      ..menuItems = [
        native.MenuItem(title: '下单'),
        native.MenuItem(
            title: '移动到', items: [native.MenuItem(title: '1'), native.MenuItem(title: '2')]),
        native.MenuItem(
            title: '设置合约',
            onSelected: () {
              Setting.Modal(context);
            }),
        native.MenuItem(title: '删除'),
      ];
    setState(() {});
  }

  void _onSetTapUp(TapUpDetails e) async {
    final position = Offset(
      e.globalPosition.dx + Offset.zero.dx,
      e.globalPosition.dy + Offset.zero.dy,
    );

    final selectedItem = await native.showContextMenu(
      native.ShowMenuArgs(
        MediaQuery.of(context).devicePixelRatio,
        position,
        [
          native.MenuItem(title: '添加合约'),
          native.MenuItem(
            title: '标记排序',
            onSelected: () {
              canDrag = !canDrag;
              setState(() {});
            },
          ),
        ],
      ),
    );

    if (selectedItem != null) {
      selectedItem.onSelected?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: const Color(0xff323337),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            //拖拽
            Container(
              child: Row(
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
                              onTap: () {
                                select_group = e;
                                setState(() {});
                              },
                              child: Container(
                                width: 35,
                                height: 20,
                                margin: EdgeInsets.all(screenUtil.adaptive(10)),
                                decoration: BoxDecoration(
                                  color: select_group == e ? Colors.blue : null,
                                  border: Border.all(
                                      color: select_group == e ? Colors.blue : Colors.white,
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
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            CommonForm<User>(
              height: MediaQuery.of(context).size.height * 0.25,
              canDrag: canDrag,
              titleColor: const Color(0x401C1D21),
              formColor: const Color(0xff1C1D21),
              onTapFunc: (User value) {
                Log.info(value.username!);
              },
              rightMenuFunc: _rightMenuFunc,
              columns: [
                FormColumn<User>(
                  title: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTapUp: _onSetTapUp,
                      child: Icon(
                        Icons.settings,
                        size: screenUtil.adaptive(20),
                        color: const Color(0xBFffffff),
                      ),
                    ),
                  ),
                  width: 50,
                  builder: (_, v) => Container(
                    child: Text(
                      '${users.indexOf(v)}',
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
                    '合约',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  builder: (_, v) => Container(
                    child: Text(
                      '${v.username ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                FormColumn<User>(
                  title: const Text(
                    '合约名',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  builder: (_, v) => Container(
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
                ),
                FormColumn<User>(
                  title: const Text(
                    '最新价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '涨幅',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '涨跌',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '买价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '卖价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '买量',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '卖量',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '成交量',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '持仓量',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '现量',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '涨停价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '涨跌价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '今开盘',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '昨收盘',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '最高价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '最低价',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '成交额',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '交易所',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
                    '行情更新时间',
                    style: TextStyle(
                      color: Color(0xBFffffff),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
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
          ],
        ),
      ),
    );
  }
}
