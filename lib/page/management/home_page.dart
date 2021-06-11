import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/page/management/tool.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';

import 'editor.dart';

class ManagePage extends StatefulWidget {
  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final EditorController editorController = EditorController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('管理后台'),
            actions: [
              Container(
                margin: EdgeInsets.only(
                  right: screenUtil.adaptive(50),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
                        width: screenUtil.adaptive(50),
                        height: screenUtil.adaptive(50),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: screenUtil.adaptive(15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final value = await showMenu<int>(
                          context: context,
                          position: RelativeRect.fromLTRB(50, 50, 30, 0),
                          items: <PopupMenuEntry<int>>[
                            PopupMenuItem<int>(
                              value: 1,
                              child: Text('退出'),
                            ),
                          ],
                        );
                        switch (value) {
                          case 1 :
                            NavigatorUtils.pop(context);
                            break;
                        }
                      },
                      child: Text('${Global.user.username ?? ''}'),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: Row(
            children: [
              Tool(
                controller: editorController,
              ),
              Expanded(
                child: Editor(
                  controller: editorController,
                ),
              )
            ],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
