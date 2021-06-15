import 'package:transaction_plus/model/user.dart';

class Global {
  static User user;
  static bool isMqttLog = false; //开启mqttlog

  //开启fiddle
  static bool isFiddle = false;
  static String fiddleIp = '192.168.1.101';
}