import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/screen.dart';

class TextInputLock extends StatefulWidget {
  final FormFieldSetter<String> onSave;

  TextInputLock({this.onSave});

  @override
  _TextInputLockState createState() => _TextInputLockState();
}

class _TextInputLockState extends State<TextInputLock> {
  bool onLock = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              readOnly: onLock,
              onSaved: widget.onSave,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: screenUtil.adaptive(5)),
            child: InkWell(
              onTap: () {
                onLock = !onLock;
                setState(() {});
              },
              child: Icon(
                onLock ? Icons.lock : Icons.lock_open,
                color: Color(0xBFffffff),
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
