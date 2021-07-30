import 'package:flutter/material.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/utils/screen.dart';

class CommonButton extends StatefulWidget {
  final String title;

  final void Function() onTap;

  CommonButton({@required this.title, @required this.onTap});

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  bool hasHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      onHover: (bool isHover) {
        hasHover = isHover;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              width: 1, color: hasHover ? Colors.white : Color(0xE6797979)),
        ),
        margin: EdgeInsets.all(screenUtil.adaptive(10)),
        padding: EdgeInsets.only(
            top: screenUtil.adaptive(3),
            bottom: screenUtil.adaptive(3),
            left: screenUtil.adaptive(12),
            right: screenUtil.adaptive(12)),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyle(
              color: hasHover ? Colors.white : Color(0xBFffffff),
              fontSize: screenUtil.getAutoSp(16)),
        ),
      ),
    );
  }
}
