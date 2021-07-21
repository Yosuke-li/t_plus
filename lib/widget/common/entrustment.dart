import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class EntrustPage extends StatefulWidget {
  @override
  _EntrustState createState() => _EntrustState();
}

class _EntrustState extends State<EntrustPage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          Expanded(
            child: CommonForm<User>(
              columns: [
                FormColumn<User>(
                  title: '报价编号',
                  builder: (_, v) => Container(
                    child: Text('${v.username.hashCode ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '合约',
                  builder: (_, v) => Container(
                    child: Text('${v.username ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '买卖',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '开平',
                  builder: (_, v) => GestureDetector(
                    child: const Icon(Icons.edit),
                  ),
                ),
                FormColumn<User>(
                  title: '挂单状态',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '报单价格',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '报单手数',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '未成交数',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '成交手数',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
                FormColumn<User>(
                  title: '详细状态',
                  builder: (_, v) => Container(
                    child: Text('${v.password ?? ''}'),
                  ),
                ),
              ],
              values: users,
            ),
          ),
          Container(
            child: Row(
              children: [
                CupertinoButton(child: Text('撤单'), onPressed: () {}),
                CupertinoButton(child: Text('全撤'), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
