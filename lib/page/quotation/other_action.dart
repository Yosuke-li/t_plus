import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transaction_plus/utils/navigator.dart';

enum OtherType {
  Edit,
  Add,
  Delete,
}

class OtherAction extends StatefulWidget {
  final OtherType type;

  const OtherAction({Key? key, required this.type}) : super(key: key);

  @override
  State<OtherAction> createState() => _OtherActionState();
}

class _OtherActionState extends State<OtherAction> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          widget.type == OtherType.Add
              ? Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '请输入合约组的名称',
                          style: TextStyle(color: Color(0xffe3e3e4)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 250,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: _controller,
                                maxLength: 20,
                                decoration: InputDecoration(
                                  hintText: '请输入',
                                  counterText: '',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10), //控制高度
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xe61C1D21),
                                    ),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RepaintBoundary(
                              child: Text(
                                '(${_controller.text.length}/20)',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : widget.type == OtherType.Edit
                  ? Container(
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '原名称：',
                              style: TextStyle(color: Color(0xffe3e3e4)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    '新名称：',
                                    style: TextStyle(color: Color(0xffe3e3e4)),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: _controller,
                                    maxLength: 20,
                                    decoration: InputDecoration(
                                      hintText: '请输入',
                                      counterText: '',
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10), //控制高度
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xe61C1D21),
                                        ),
                                      ),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RepaintBoundary(
                                  child: Text(
                                    '(${_controller.text.length}/20)',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '确定删除当前合约组',
                              style: TextStyle(color: Color(0xffe3e3e4)),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '(组内的合约也会被删除)',
                              style: TextStyle(color: Color(0xffe3e3e4)),
                            ),
                          ),
                        ],
                      ),
                    ),
          Container(
            margin: const EdgeInsets.only(right: 20),
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
