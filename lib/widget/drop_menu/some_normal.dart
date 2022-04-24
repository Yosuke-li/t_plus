import 'package:flutter/material.dart';

class NormalInput {
  static Decoration normal() {
    return BoxDecoration(
      border: Border.all(
        color: const Color(0xff797979),
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );
  }
}
