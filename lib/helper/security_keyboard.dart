import 'dart:io';

import 'package:flutter/material.dart';
import 'package:transaction_plus/helper/keyboard_list/number.dart';
import 'package:transaction_plus/helper/keyboard_list/text.dart';
import 'package:transaction_plus/widget/keyboard/keyboard_controller.dart';
import 'package:transaction_plus/widget/keyboard/keyboard_manager.dart';

typedef KeyboardSwitch = Function(SecurityKeyboardType type);

enum SecurityKeyboardType { text, number }

extension SecurityKeyboardTypeTxt on SecurityKeyboardType {
  String get enumToString {
    switch (this) {
      case SecurityKeyboardType.number:
        return 'SecurityKeyboardTypeNumber';
        break;
      case SecurityKeyboardType.text:
        return 'SecurityKeyboardTypeText';
        break;
    }
  }
}

class SecurityKeyboardCenter {

  static dynamic number = Platform.isWindows || Platform.isMacOS
      ? TextInputType.number
      : SecurityTextInputType(name: SecurityKeyboardType.number.enumToString);

  static dynamic text = Platform.isWindows || Platform.isMacOS
      ? TextInputType.text
      : SecurityTextInputType(name: SecurityKeyboardType.text.enumToString);

  static register() {
    if (Platform.isWindows || Platform.isMacOS) {
      return;
    }
    KeyboardManager.addKeyboard(
      SecurityKeyboardCenter.number,
      KeyboardConfig(
          builder: (context, controller, params) {
            return SecurityKeyboard(
              controller: controller,
              type: SecurityKeyboardType.number,
            );
          },
          getHeight: SecurityKeyboard.getHeight),
    );
    KeyboardManager.addKeyboard(
      SecurityKeyboardCenter.text,
      KeyboardConfig(
          builder: (context, controller, params) {
            return SecurityKeyboard(
              controller: controller,
              type: SecurityKeyboardType.text,
            );
          },
          getHeight: SecurityKeyboard.getHeight),
    );
  }
}

class SecurityKeyboard extends StatelessWidget {

  static double getHeight(BuildContext ctx) {
    MediaQueryData mediaQuery = MediaQuery.of(ctx);
    return mediaQuery.size.width / 3 / 2 * 4;
  }

  final KeyboardController controller;

  final SecurityKeyboardType type;

  const SecurityKeyboard({required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    Widget keyboard;
    switch (type) {
      case SecurityKeyboardType.number:
        keyboard = SecurityKeyboardNumber(controller: controller,);
        break;
      case SecurityKeyboardType.text:
        keyboard = SecurityKeyboardText(controller: controller,);
        break;
    }
    return keyboard;
  }
}
