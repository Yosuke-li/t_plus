import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';
import 'package:transaction_plus/utils/log_utils.dart';

import '../../widget/modal_utils.dart';

class Setting {
  static Future<void> Model(BuildContext context,
      {void Function()? onFunc}) async {
    await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff606266),
      dynamicBottom: Container(
        alignment: Alignment.center,
        width: 100,
        height: 200,
        child: Column(
          children: [
            Container(
              child: Text('添加自选合约'),
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

  String select = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (String value) {
                      Log.info(value);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Text('交易所'),
                        Expanded(
                          child: MiraiPopupMenu(
                            children: _exchange,
                            itemWidget: (int index, String item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              key: Key('${select.hashCode}'),
                              child: Text(
                                '$select',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
