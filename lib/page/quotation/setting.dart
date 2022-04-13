import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';
import 'package:transaction_plus/widget/miral_drop_menu/miral_drop.dart';

import '../../widget/modal_utils.dart';

class Setting {
  static Future<void> Model(BuildContext context,
      {void Function()? onFunc}) async {
    await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff606266),
      dynamicBottom: Container(
        alignment: Alignment.center,
        width: 150,
        height: 480,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                '添加自选合约',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: SettingSearch(),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingSearch extends StatefulWidget {
  const SettingSearch({Key? key}) : super(key: key);

  @override
  State<SettingSearch> createState() => _SettingSearchState();
}

class _SettingSearchState extends State<SettingSearch> {
  List<String> _exchange = <String>['1', '2', '3'];
  final TextEditingController _controller = TextEditingController();
  late ValueNotifier<String> valueNotifier;

  List<String> exchanges = ['1', '2'];

  String select = '1';
  bool select_all = false;
  List<String> _select_list = [];

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier<String>(
      _exchange.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff797979), width: 1)),
                        hintText: '请搜索',
                        suffixIcon: Icon(Icons.search)),
                    controller: _controller,
                    onChanged: (String value) {
                      Log.info(value);
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 200,
                  height: 31,
                  child: Row(
                    children: [
                      Text('交易所：'),
                      Expanded(
                        child: MiraiDropdownWidget(
                          valueNotifier: valueNotifier,
                          showSeparator: true,
                          itemWidget: (int index, String item) {
                            return MiraiDropDownItemWidget(item: item);
                          },
                          children: _exchange,
                          onChanged: (String value) {
                            valueNotifier.value = value;
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
                    margin: EdgeInsets.only(
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
                                  color: Colors.black,
                                  child: CommonForm<String>(
                                    height: 300,
                                    onTapFunc: (String value) {},
                                    columns: [
                                      FormColumn<String>(
                                        title: Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Checkbox(
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              value: select_all,
                                              onChanged: (bool? value) {
                                                select_all = !select_all;
                                                if (select_all) {
                                                  _select_list.addAll(exchanges);
                                                } else {
                                                  _select_list.clear();
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                        width: 50,
                                        builder: (_, v) => Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Checkbox(
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              value: _select_list.indexOf(v) >= 0,
                                              onChanged: (bool? value) {
                                                if (_select_list.indexOf(v) >=
                                                    0) {
                                                  _select_list.remove(v);
                                                } else {
                                                  _select_list.add(v);
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
                                    values: exchanges,
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
                                      width: 35,
                                      height: 20,
                                      margin: EdgeInsets.all(
                                          screenUtil.adaptive(10)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Text('添加',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 35,
                                      height: 20,
                                      margin: EdgeInsets.all(
                                          screenUtil.adaptive(10)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Text('删除',
                                          textAlign: TextAlign.center),
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
                                margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: MiraiDropdownWidget(
                                        valueNotifier: valueNotifier,
                                        showSeparator: true,
                                        underline: true,
                                        itemWidget: (int index, String item) {
                                          return MiraiDropDownItemWidget(
                                              item: item);
                                        },
                                        children: _exchange,
                                        onChanged: (String value) {
                                          valueNotifier.value = value;
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.edit,
                                                size: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.add,
                                                size: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            InkWell(
                                              onTap: () {},
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
                                  color: Colors.black,
                                  child: CommonForm<String>(
                                    height: 300,
                                    onTapFunc: (String value) {},
                                    columns: [
                                      FormColumn<String>(
                                        title: Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Checkbox(
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              value: select_all,
                                              onChanged: (bool? value) {
                                                select_all = !select_all;
                                                if (select_all) {
                                                  _select_list.addAll(exchanges);
                                                } else {
                                                  _select_list.clear();
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                        width: 50,
                                        builder: (_, v) => Container(
                                          child: Transform.scale(
                                            scale: 0.8,
                                            child: Checkbox(
                                              visualDensity: VisualDensity(
                                                  horizontal: -4, vertical: -4),
                                              value: _select_list.indexOf(v) >= 0,
                                              onChanged: (bool? value) {
                                                if (_select_list.indexOf(v) >=
                                                    0) {
                                                  _select_list.remove(v);
                                                } else {
                                                  _select_list.add(v);
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
                                    values: exchanges,
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
                  margin: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('确定'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {},
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
