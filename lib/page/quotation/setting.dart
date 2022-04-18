import 'package:flutter/material.dart';
import 'package:transaction_plus/page/quotation/other_action.dart';
import 'package:transaction_plus/page/quotation/setting_search.dart';
import 'package:transaction_plus/utils/navigator.dart';

import '../../widget/modal_utils.dart';

class Setting {
  static Future<void> Modal(BuildContext context,
      {void Function()? onFunc}) async {
    await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff323337),
      border: Border.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      ModalSize: ModalSize(width: null, height: 510),
      body: Container(
        alignment: Alignment.center,
        height: 470,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                '合约设置',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: SettingSearch(),
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool?> otherAction(BuildContext context,
      {void Function()? onFunc, String? title, required OtherType type}) async {
    return await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff1C1D21),
      border: Border.all(
        color: Colors.black,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      ModalSize: ModalSize(width: 300, height: type == OtherType.Delete ? 210 : 220),
      body: Container(
        alignment: Alignment.center,
        height: type == OtherType.Delete ? 180 : 190,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${title ?? ''}',
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      NavigatorUtils.pop(context);
                    },
                    child: Icon(Icons.close),
                  )
                ],
              )
            ),
            Expanded(
              child: OtherAction(
                type: type,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
