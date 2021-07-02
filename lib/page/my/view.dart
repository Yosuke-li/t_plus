import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';

import 'logic.dart';
import 'state.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final MyLogic logic = Get.put(MyLogic());
  final MyState state = Get.find<MyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenUtil.adaptive(650),
            child: Stack(
              children: [
                Container(
                  height: screenUtil.adaptive(500),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957'),
                    ),
                  ),
                ),
                Positioned(
                  top: screenUtil.adaptive(370),
                  left: screenUtil.adaptive(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/data/sun.jpg',
                          width: screenUtil.adaptive(250),
                          height: screenUtil.adaptive(250),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: screenUtil.adaptive(140),
                          left: screenUtil.adaptive(20),
                        ),
                        child: Text(
                          '${Global.user.username ?? ''}',
                          style: TextStyle(
                            fontSize: screenUtil.getAutoSp(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: screenUtil.adaptive(80), right: screenUtil.adaptive(80)),
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: screenUtil.adaptive(80), right: screenUtil.adaptive(80)),
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 2),
              children: [
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.bookmark_border),
                    Container(
                      child: Text('下单'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: screenUtil.adaptive(100),
              bottom: screenUtil.adaptive(100),
            ),
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: screenUtil.adaptive(300),
                height: screenUtil.adaptive(100),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    //border边框圆角
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Text(
                  '退出登陆',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                NavigatorUtils.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MyLogic>();
    super.dispose();
  }
}
