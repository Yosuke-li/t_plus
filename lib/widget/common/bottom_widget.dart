import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class BottomWidgetPage extends StatefulWidget {

  const BottomWidgetPage({Key? key}) : super(key: key);

  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidgetPage> {
  DateTime now = DateTime.now();
  late void Function() _timer;

  void startClock() {
    _timer = Timer.periodic(const Duration(microseconds: 1000), (Timer t) {
      if (!mounted) {
        return;
      }
      setState(() {
        now = DateTime.now();
      });
    }).cancel;
    setState(() {});
  }

  String pad0(int num) {
    if (num < 10) {
      return '0${num.toString()}';
    }
    return num.toString();
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RepaintBoundary(
            child: Container(
              margin: EdgeInsets.only(right: screenUtil.adaptive(20)),
              child: Text(
                  '${now.year}-${now.month}-${now.day} ${pad0(now.hour)}:${pad0(now.minute)}:${pad0(now.second)}'),
            ),
          ),
          InkWell(
            onTap: () {
              EventBusHelper.asyncStreamController!
                  .add(EventCache()..isDarkTheme = false);
              NavigatorUtils.pop(context);
            },
            child: Container(
              child: Text('行情服务器登录成功'),
            ),
          ),
        ],
      ),
    );
  }
}
