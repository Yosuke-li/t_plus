import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/page/login/view.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/navigator_helper.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/keyboard/keyboard_root.dart';

import 'home_main/view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigatorInitializer(
      child: ScreenWidget(
        child: GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark
          ),
          builder: BotToastInit(),
          navigatorObservers: <NavigatorObserver>[BotToastNavigatorObserver()],
          home: KeyboardRootWidget(child: IndexPage(),),
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
