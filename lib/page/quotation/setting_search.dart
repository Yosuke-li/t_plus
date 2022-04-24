import 'package:flutter/material.dart';
import 'package:transaction_plus/page/quotation/other_action.dart';
import 'package:transaction_plus/page/quotation/setting.dart';

import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/api_call_back.dart';
import 'package:transaction_plus/widget/drop_menu/overlay_field.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class SettingSearch extends StatefulWidget {
  const SettingSearch({Key? key}) : super(key: key);

  @override
  State<SettingSearch> createState() => _SettingSearchState();
}

class _SettingSearchState extends State<SettingSearch> {
  // init数据
  List<String> _exchange = <String>['1', '2', '3', '32', '4', '13', '23'];
  final TextEditingController _controller = TextEditingController();
  late String exchange;

  List<String> exchanges = ['12', '23', '4', '61', '56'];

  String select = '1';
  bool select_all = false;

  // method数据
  List<String> _show_list = [];
  List<String> _group_list = [];
  List<String> _select_add_list = [];
  List<String> _select_del_list = [];

  @override
  void initState() {
    super.initState();
    exchange = exchanges.first;
    _show_list = exchanges;
    setState(() {});
  }

  // 搜索
  Future<void> _search(String key) async {
    if (key.isNotEmpty == true) {
      _show_list =
          exchanges.where((String element) => element.contains(key)).toList();
    } else {
      _show_list = exchanges;
    }
    setState(() {});
  }

  // button 添加
  Future<void> _add() async {}

  // button 删除
  Future<void> _delete() async {}

  // icon 修改
  Future<void> _icon_edit() async {
    final bool? refresh = await Setting.otherAction(
      context,
      type: OtherType.Edit,
      title: '编辑合约组',
    );

    if (refresh == true) {
      //刷新
    }
  }

  // icon 添加
  Future<void> _icon_add() async {
    final bool? refresh = await Setting.otherAction(
      context,
      type: OtherType.Add,
      title: '新建合约组',
    );

    if (refresh == true) {
      //刷新
    }
  }

  // icon 删除
  Future<void> _icon_del() async {
    final bool? refresh = await Setting.otherAction(
      context,
      type: OtherType.Delete,
      title: '操作确认',
    );

    if (refresh == true) {
      //刷新
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff323337),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 30,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff797979), width: 1)),
                        hintText: '请搜索',
                        suffixIcon: Icon(Icons.search)),
                    controller: _controller,
                    onChanged: (String value) async {
                      await loadingCallback(() => _search(value));
                    },
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  width: 200,
                  height: 31,
                  child: Row(
                    children: [
                      const Text('交易所：'),
                      Expanded(
                        child: OverlayField<String>(
                          initValue: exchange,
                          child: (String item) {
                            return Text(item);
                          },
                          lists: _exchange,
                          onChange: (String value) {
                            exchange = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 30, right: 20, left: 20, bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '合约列表',
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Color(0xff27282B),
                                  child: CommonForm<String>(
                                    height: 300,
                                    titleColor: Color(0x4D797979),
                                    formColor: Color(0xff27282B),
                                    onTapFunc: (String value) {},
                                    columns: [
                                      FormColumn<String>(
                                        title: Container(),
                                        width: 50,
                                        builder: (_, v) => Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Checkbox(
                                              activeColor: Color(0xcc4285F4),
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              value:
                                                  _select_add_list.indexOf(v) >=
                                                      0,
                                              onChanged: (bool? value) {
                                                if (_select_add_list
                                                        .indexOf(v) >=
                                                    0) {
                                                  _select_add_list.remove(v);
                                                } else {
                                                  _select_add_list.add(v);
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      FormColumn<String>(
                                        title: Text(
                                          '交易代码',
                                          style: TextStyle(
                                              color: Color(0xBFffffff)),
                                        ),
                                        builder: (_, v) => Container(
                                          child: Text('${v}'),
                                        ),
                                      ),
                                      FormColumn<String>(
                                        title: Text(
                                          '合约名称',
                                          style: TextStyle(
                                              color: Color(0xBFffffff)),
                                        ),
                                        builder: (_, v) => Container(
                                          child: Text('${v}'),
                                        ),
                                      ),
                                    ],
                                    values: _show_list,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 45,
                                      height: 25,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(
                                          screenUtil.adaptive(10)),
                                      decoration: BoxDecoration(
                                        color: _select_add_list.length > 0
                                            ? Color(0xcc4285F4)
                                            : null,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.elliptical(
                                            screenUtil.adaptive(5),
                                            screenUtil.adaptive(5),
                                          ),
                                          bottom: Radius.elliptical(
                                            screenUtil.adaptive(5),
                                            screenUtil.adaptive(5),
                                          ),
                                        ),
                                        border: Border.all(
                                            color: _select_add_list.length > 0
                                                ? Color(0xcc4285F4)
                                                : Color(0x80797979),
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Text(
                                        '添加',
                                        style: TextStyle(
                                          color: Color(0x80ffffff),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 45,
                                      height: 25,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(
                                          screenUtil.adaptive(10)),
                                      decoration: BoxDecoration(
                                        color: _select_del_list.length > 0
                                            ? Color(0xcc4285F4)
                                            : null,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.elliptical(
                                            screenUtil.adaptive(5),
                                            screenUtil.adaptive(5),
                                          ),
                                          bottom: Radius.elliptical(
                                            screenUtil.adaptive(5),
                                            screenUtil.adaptive(5),
                                          ),
                                        ),
                                        border: Border.all(
                                            color: _select_del_list.length > 0
                                                ? Color(0xcc4285F4)
                                                : Color(0x80797979),
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Text(
                                        '删除',
                                        style: TextStyle(
                                          color: Color(0x80ffffff),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: OverlayField<String>(
                                        initValue: exchange,
                                        child: (String item) {
                                          return Text(item);
                                        },
                                        lists: _exchange,
                                        onChange: (String value) {
                                          exchange = value;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                _icon_edit();
                                              },
                                              child: Icon(
                                                Icons.edit,
                                                size: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _icon_add();
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _icon_del();
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Color(0xff27282B),
                                  child: CommonForm<String>(
                                    height: 300,
                                    titleColor: Color(0x4D797979),
                                    formColor: Color(0xff27282B),
                                    onTapFunc: (String value) {},
                                    columns: [
                                      FormColumn<String>(
                                        title: Container(),
                                        width: 50,
                                        builder: (_, v) => Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Checkbox(
                                              activeColor: Color(0xcc4285F4),
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              value:
                                                  _select_del_list.indexOf(v) >=
                                                      0,
                                              onChanged: (bool? value) {
                                                if (_select_del_list
                                                        .indexOf(v) >=
                                                    0) {
                                                  _select_del_list.remove(v);
                                                } else {
                                                  _select_del_list.add(v);
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      FormColumn<String>(
                                        title: Text(
                                          '交易代码',
                                          style: TextStyle(
                                              color: Color(0xBFffffff)),
                                        ),
                                        builder: (_, v) => Container(
                                          child: Text('${v}'),
                                        ),
                                      ),
                                      FormColumn<String>(
                                        title: Text(
                                          '合约名称',
                                          style: TextStyle(
                                              color: Color(0xBFffffff)),
                                        ),
                                        builder: (_, v) => Container(
                                          child: Text('${v}'),
                                        ),
                                      ),
                                    ],
                                    values: _group_list,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          NavigatorUtils.pop(context);
                        },
                        child: Text('应用'),
                      ),
                      const SizedBox(
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
