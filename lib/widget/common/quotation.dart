import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class Quotation extends StatefulWidget {
  @override
  _QuotationState createState() => _QuotationState();
}

class _QuotationState extends State<Quotation> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Global.formBackColor,
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            CommonForm<User>(
              columns: [
                FormColumn<User>(
                  title: Icon(
                    Icons.settings,
                    size: screenUtil.adaptive(20),
                    color: Color(0xBFffffff),
                  ),
                  width: 50,
                  builder: (_, v) => Container(
                    child: Text('${''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '合约',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.username.hashCode ?? ''}'),
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
                    '买量',
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
                    '涨停价',
                    style: TextStyle(color: Color(0xBFffffff)),
                  ),
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: Text(
                    '跌停价',
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
                    '昨结算',
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
