import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/utils/api_exception.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/lock.dart';

///MqttServerClient('ws://', '')
///client.useWebSocket
class MqttHelper {
  static MqttServerClient client;

  static Lock _lock = Lock();

  //初始化
  static Future<void> init() async {
    if (client == null) {
      connect();
    }
  }

  static Future<void> connect() async {
    client = MqttServerClient.withPort('broker.emqx.io', '', 1883);
    // client = MqttServerClient('ws://172.31.41.83/mqtt', '');
    // client.port = 8888;
    // client.useWebSocket = true;
    client.logging(on: false);
    client.keepAlivePeriod = 20;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } on SocketException catch (e) {
      client.disconnect();
    } catch (e) {
      client.disconnect();
    }

    client.subscribe("topic/test2", MqttQos.atLeastOnce);

    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      EventBusHelper.asyncStreamController
          .add(EventCache()..realTimeData = payload);
      print('${c[0].topic} Received message: $payload');
    });
  }

  // 连接成功
  static void onConnected() {
    print('${client.hashCode} Connected');
  }

  // 连接断开
  static void onDisconnected() {
    print('${client.hashCode} Disconnected');
    client = null;
    throw ApiException(401, 'mqtt disConnected');
  }

  // 订阅主题成功
  static void onSubscribed(String topic) {
    print('${client.hashCode} Subscribed topic: $topic');
  }

  // 订阅主题失败
  static void onSubscribeFail(String topic) {
    print('${client.hashCode} Failed to subscribe $topic');
  }

  // 成功取消订阅
  static void onUnsubscribed(String topic) {
    print('${client.hashCode} Unsubscribed topic: $topic');
  }

  // 收到 PING 响应
  static void pong() {
    print('${client.hashCode} Ping response client callback invoked');
  }
}
