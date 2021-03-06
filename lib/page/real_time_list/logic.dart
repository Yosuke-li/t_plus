import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/mqtt_helper.dart';

import 'state.dart';

class RealTimeListLogic extends GetxController {
  final state = RealTimeListState();

  @override
  void onReady() {
    _setEventBus();
    super.onReady();
  }

  void publish(String msg) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(msg);
    MqttHelper.client
        ?.publishMessage("topic/test2", MqttQos.exactlyOnce, builder.payload!);
  }

  void _setEventBus() {
    state.voidCallback = EventBusHelper.listen<EventCache>((EventCache event) {
      if (event.realTimeData != null && event.realTimeData.isNotEmpty == true) {
        state.realDatas.value.insert(0, event.realTimeData);
        state.realDatas.refresh();
      }
    }).cancel;
  }
}
