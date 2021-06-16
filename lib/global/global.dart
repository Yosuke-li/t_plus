import 'package:flutter/foundation.dart';
import 'package:transaction_plus/model/user.dart';

class Global {
  static bool isRelease = kReleaseMode;

  static User user;
  static bool isMqttLog = false; //开启mqttlog

  //开启fiddle
  static bool isFiddle = false;
  static String fiddleIp = '192.168.9.136';
}