import 'package:flutter/material.dart';
import 'package:transaction_plus/helper/security_keyboard.dart';
import 'package:transaction_plus/utils/screen.dart';

class TextInputNumberUpDown extends StatefulWidget {
  final FormFieldSetter<String> onSave;

  TextInputNumberUpDown({this.onSave});

  @override
  _TextInputNumberUpDownState createState() => _TextInputNumberUpDownState();
}

class _TextInputNumberUpDownState extends State<TextInputNumberUpDown> {
  bool onLock = false;
  TextEditingController controller = TextEditingController();

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
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: SecurityKeyboardCenter.number,
              onSaved: widget.onSave,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: screenUtil.adaptive(5)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (controller.text == null ||
                        controller.text.isEmpty == true) {
                      controller.text = '1';
                    } else {
                      controller.text =
                          (int.tryParse(controller.text) + 1).toString();
                    }
                  },
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Color(0xBFffffff),
                    size: screenUtil.adaptive(12),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (controller.text == null ||
                        controller.text.isEmpty == true) {
                      controller.text = '0';
                    } else {
                      controller.text =
                          (int.tryParse(controller.text) - 1).toString();
                    }
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xBFffffff),
                    size: screenUtil.adaptive(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
