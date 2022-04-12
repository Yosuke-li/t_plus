import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/page/quotation/setting.dart';
import 'package:transaction_plus/utils/array_helper.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

import '../../widget/popup_sub_menu_item.dart';

class Quotation extends StatefulWidget {
  @override
  _QuotationState createState() => _QuotationState();
}

class _QuotationState extends State<Quotation> {
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

  @override
  void initState() {
    super.initState();
  }

  //右键菜单栏
  Future<void> _onPointerDown(PointerDownEvent event, int index) async {
    List<PopupMenuEntry<int>> menuItems = <PopupMenuEntry<int>>[
      PopupMenuItem(child: Text('下单'), value: 1),
      PopupSubMenuItem<int>(
        title: '移动到',
        items: [
          100,
          200,
          300,
          400,
          500,
        ],
        onSelected: (value) {
          Log.info(value);
        },
      ),
      PopupMenuItem(child: Text('设置合约'), value: 2),
      PopupMenuItem(child: Text('删除'), value: 3),
    ];

    if (event.kind == PointerDeviceKind.mouse &&
        event.buttons == kSecondaryMouseButton) {
      final RenderBox overlay =
          Overlay.of(context)?.context.findRenderObject() as RenderBox;
      final int? menuItem = await showMenu<int>(
          context: context,
          items: menuItems,
          position: RelativeRect.fromSize(
              event.position & Size(48.0, 48.0), overlay.size));

      switch (menuItem) {
        case 2:
          await Setting.Model(context);
          return;
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Color(0xff000000),
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
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            CommonForm<User>(
              height: MediaQuery.of(context).size.height * 0.25,
              canDrag: true,
              onMouseEvent: _onPointerDown,
              onTapFunc: (User value) {
                Log.info(value.username!);
              },
              columns: [
                FormColumn<User>(
                  title: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.settings,
                      size: screenUtil.adaptive(20),
                      color: Color(0xBFffffff),
                    ),
                  ),
                  width: 50,
                  builder: (_, v) => Container(
                    child: Text(''),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '合约',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.username ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '合约名',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.username ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '最新价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '涨幅',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '涨跌',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '买价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '卖价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '买量',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '卖量',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '成交量',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '持仓量',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '现量',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '涨停价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '涨跌价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '今开盘',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '昨收盘',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '最高价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '最低价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '成交额',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '交易所',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '行情更新时间',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
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
