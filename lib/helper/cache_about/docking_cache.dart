import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/store.dart';
import 'package:transaction_plus/widget/docking/docking_layout.dart';

class DockingCache {
  static void setCache(String key, dynamic dockingArea) {
    print(jsonEncode(dockingArea));
    LocateStorage.setStringWithExpire(key ,
        jsonEncode(dockingArea), const Duration(days: 1));
  }

  static DockingArea getCacheWithKey(String key) {
    return null;
  }
}