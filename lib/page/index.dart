import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/page/login/view.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/navigator_helper.dart';
import 'package:transaction_plus/utils/screen.dart';

import 'home_main/view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TransitionBuilder toastWidget = BotToastInit();
    return NavigatorInitializer(
      child: ScreenWidget(
        child: GetMaterialApp(
          title: '',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          navigatorObservers: <NavigatorObserver>[BotToastNavigatorObserver()],
          home: MaterialApp(
            builder: (BuildContext c, Widget child) {
              return toastWidget(c, IndexPage());
            },
          ),
        ),
      ),
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    Log.init(isDebug: !Global.isRelease);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        );
      },
    );
  }
}
