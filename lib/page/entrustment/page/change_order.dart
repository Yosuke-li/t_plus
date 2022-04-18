import 'package:flutter/material.dart';

import 'package:transaction_plus/page/entrustment/entrust_modal.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/widget/modal_utils.dart';

class ChangeOrder extends StatefulWidget {
  const ChangeOrder({Key? key}) : super(key: key);

  @override
  State<ChangeOrder> createState() => _ChangeOrderState();
}

class _ChangeOrderState extends State<ChangeOrder> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void onSubmit() async {
    final bool? reBack = await EntrustModal.Modal(
      context,
      child: ActionConfirm(
        lastOrder: 1,
        newOrder: 2,
      ),
      title: '改单确认',
      size: ModalSize(width: 400, height: 260),
    );

    if (reBack == true) {
      NavigatorUtils.pop(context, results: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: [
                          Text('合约:'),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabled: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                readOnly: true,
                                initialValue: '',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: Row(
                        children: [
                          Text('方向: '),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabled: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                readOnly: true,
                                initialValue: '',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: [
                          Text('投保:'),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabled: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                readOnly: true,
                                initialValue: '',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: Row(
                        children: [
                          Text('开平: '),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                readOnly: true,
                                initialValue: '',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: [
                          Text('类型:'),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabled: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                readOnly: true,
                                initialValue: '',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: Row(
                        children: [
                          Text('价格: '),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                initialValue: '',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: [
                          Text('TIF:'),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabled: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                readOnly: true,
                                initialValue: '',
                                onSaved: (String? value) {},
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: Row(
                        children: [
                          Text('手数: '),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff797979), width: 1)),
                                ),
                                initialValue: '',
                                onSaved: (String? value) {},
                              ),
                            ),
                          )
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
                    onPressed: () {
                      onSubmit();
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
    );
  }
}

class ActionConfirm extends StatelessWidget {
  dynamic lastOrder;
  dynamic newOrder;

  ActionConfirm({Key? key, required this.lastOrder, required this.newOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Text('确定改单  吗？'),
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
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: const Text('下单:'),
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
                  onPressed: () {
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
