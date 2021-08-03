import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class UnsettledPage extends StatefulWidget {
  @override
  _UnsettledState createState() => _UnsettledState();
}

class _UnsettledState extends State<UnsettledPage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Color(0xff000000),
        alignment: Alignment.centerLeft,
        child: Column(
        children: [
          CommonForm<User>(
            columns: [
              FormColumn<User>(
                title: Text('id', style: TextStyle(color: Color(0xBFffffff)),),
                builder: (_, v) => Container(
                  child: Text('${v.username.hashCode ?? ''}'),
                ),
              ),
              FormColumn<User>(
                title: Text('姓名', style: TextStyle(color: Color(0xBFffffff)),),
                builder: (_, v) => Container(
                  child: Text('${v.username ?? ''}'),
                ),
              ),
              FormColumn<User>(
                title: Text('详情', style: TextStyle(color: Color(0xBFffffff)),),
                builder: (_, v) => Container(
                  child: Text('${v.password ?? ''}'),
                ),
              ),
              FormColumn<User>(
                title: Text('操作', style: TextStyle(color: Color(0xBFffffff)),),
                builder: (_, v) => GestureDetector(
                  child: const Icon(Icons.edit),
                ),
              ),
            ],
            values: users,
          )
        ],
      ),
    ),);
  }
}
