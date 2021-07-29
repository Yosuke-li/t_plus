import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common/button.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class PositionPage extends StatefulWidget {
  @override
  _PositionState createState() => _PositionState();
}

class _PositionState extends State<PositionPage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Global.formBackColor,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CommonForm<User>(
                columns: [
                  FormColumn<User>(
                    title: '合约',
                    builder: (_, v) => Container(
                      child: Text('${v.username.hashCode ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '合约名',
                    builder: (_, v) => Container(
                      child: Text('${v.username ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '最新价',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '涨跌',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '买价',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '买量',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '成交量',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '持仓量',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '涨停价',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '跌停价',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '今开盘',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                  FormColumn<User>(
                    title: '昨结算',
                    builder: (_, v) => Container(
                      child: Text('${v.password ?? ''}'),
                    ),
                  ),
                ],
                values: users,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      commonButton(title: '持仓', onTap: () {}),
                      commonButton(title: '明细', onTap: () {}),
                      commonButton(title: '组合', onTap: () {}),
                    ],
                  ),
                  Row(
                    children: [
                      commonButton(title: '对价平仓', onTap: () {}),
                      commonButton(title: '市价平仓', onTap: () {}),
                      commonButton(title: '市价反手', onTap: () {}),
                      commonButton(title: '大商所组合', onTap: () {}),
                    ],
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
