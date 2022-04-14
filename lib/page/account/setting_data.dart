import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/array_helper.dart';
import 'package:transaction_plus/utils/navigator.dart';

class SettingData extends StatefulWidget {
  const SettingData({Key? key}) : super(key: key);

  @override
  State<SettingData> createState() => _SettingDataState();
}

class _SettingDataState extends State<SettingData> {
  static const List<String> _data = <String>[
    '期初现金',
    '持仓保证金',
    '手续费',
    '额度',
    '挂单维持保证金',
    '挂单手续费',
    '权益',
    '持仓维持保证金',
    '兑基币汇率',
    '可用资金',
    '追加保证金',
    '初始保证金',
    '出入金',
    '维持保证金',
    '风险度',
    '挂单保证金',
    '盈亏',
  ];
  List<String> _select = <String>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Expanded(child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 8,
            ),
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              final String? value = ArrayHelper.get(_data, index);
              return Container(
                child: Row(
                  children: [
                    Checkbox(
                      value: _select.contains(value),
                      onChanged: (bool? v) {},
                    ),
                    Text('$value')
                  ],
                ),
              );
            },
          ),),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text('提示：最多只能选择五个数据', style: TextStyle(fontSize: 12),),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, bottom: 10),
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
    );
  }
}
