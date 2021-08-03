import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/page/login/view.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/log_utils.dart';
import 'package:transaction_plus/utils/navigator_helper.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/keyboard/keyboard_root.dart';

import 'home_main/view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexPage();
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  VoidCallback voidCallback;
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    Log.init(isDebug: !Global.isRelease);
    eventListen();
  }

  void eventListen() {
    voidCallback = EventBusHelper.listen<EventCache>((EventCache event) {
      if (event.isDarkTheme != null) {
        Global.isDarkTheme = event.isDarkTheme;
        isDarkTheme = event.isDarkTheme;
        setState(() {});
      }
    }).cancel;
  }

  @override
  void dispose() {
    super.dispose();
    voidCallback?.call();
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorInitializer(
      child: ScreenWidget(
        child: GetMaterialApp(
          theme: isDarkTheme
              ? ThemeData(
                  primarySwatch: Colors.blue, brightness: Brightness.dark)
              : ThemeData(
                  primarySwatch: Colors.blue, brightness: Brightness.light),
          builder: BotToastInit(),
          navigatorObservers: <NavigatorObserver>[BotToastNavigatorObserver()],
          home: KeyboardRootWidget(
            child: Navigator(
              onGenerateRoute: (RouteSettings setting) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
