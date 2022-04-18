import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/navigator.dart';

class DeleteOrder extends StatelessWidget {
  const DeleteOrder({Key? key}) : super(key: key);

  Future<void> onDelete() async {
    Log.info('撤单方法');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Text('确定撤单  吗？'),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: const Text('撤单:'),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              right: 10, top: 2, bottom: 2, left: 10),
                          decoration: BoxDecoration(
                            color: Color(0xff525253),
                          ),
                          child: Text('开仓'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              right: 10, top: 2, bottom: 2, left: 10),
                          decoration: BoxDecoration(
                            color: Color(0xff525253),
                          ),
                          child: Text('开仓'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await onDelete();
                    NavigatorUtils.pop(context, results: true);
                  },
                  child: Text('确定'),
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
    );
  }
}
