import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/model/user.dart';

class Global {
  static bool isRelease = kReleaseMode;

  static User user;
  static bool isMqttLog = false; //开启mqttlog
  static bool isDoraemonkit = false; //开启哆啦A梦

  //开启fiddle
  static bool isFiddle = false;
  static String fiddleIp = '192.168.9.136';

  static bool isDarkTheme = false;

  static Color formTitleColor = isDarkTheme ? null : Color(0xfff5fafe);
  static Color formBorderColor = isDarkTheme ? Color(0xE6797979) :Colors.black26;
  static Color formBackColor = isDarkTheme ? Color(0xff000000) :Colors.white;
  static Color appBarBackColor = isDarkTheme ? Color(0xCC77787b) :Colors.white;
  static Color dockingTitleColor = isDarkTheme ? null : Colors.grey[200];
}
