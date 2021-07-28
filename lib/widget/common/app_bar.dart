import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/widget/common_form.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarPage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Global.appBarBackColor,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                NavigatorUtils.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(20),
                    right: screenUtil.adaptive(30)),
                child: Image.network(
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
                  width: screenUtil.adaptive(50),
                  height: screenUtil.adaptive(50),
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(10),
                    right: screenUtil.adaptive(10)),
                child: Text('设置',
                  style: TextStyle(
                    fontSize: screenUtil.getAutoSp(18),
                  ),),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(10),
                    right: screenUtil.adaptive(10)),
                child: Text(
                  '菜单',
                  style: TextStyle(
                    fontSize: screenUtil.getAutoSp(18),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(10),
                    right: screenUtil.adaptive(10)),
                child: Text('资讯',
                  style: TextStyle(
                    fontSize: screenUtil.getAutoSp(18),
                  ),),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(
                    left: screenUtil.adaptive(10),
                    right: screenUtil.adaptive(10)),
                child: Text('帮助',
                  style: TextStyle(
                    fontSize: screenUtil.getAutoSp(18),
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
