import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/utils/screen.dart';

Widget commonButton({@required String title, @required void Function() onTap}) {
  return InkWell(
    onTap: () {
      onTap?.call();
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(3),
        border: Border.all(width: 1, color: Global.formBorderColor),
      ),
      margin: EdgeInsets.all(screenUtil.adaptive(10)),
      padding: EdgeInsets.only(
          top: screenUtil.adaptive(3),
          bottom: screenUtil.adaptive(3),
          left: screenUtil.adaptive(12),
          right: screenUtil.adaptive(12)),
      alignment: Alignment.center,
      child: Text(
        title,
        style:
            TextStyle(color: Colors.white, fontSize: screenUtil.getAutoSp(16)),
      ),
    ),
  );
}
