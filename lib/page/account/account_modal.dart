import 'package:flutter/material.dart';
import 'package:transaction_plus/page/account/account_detail.dart';
import 'package:transaction_plus/page/account/setting_data.dart';
import 'package:transaction_plus/utils/navigator.dart';

import '../../widget/modal_utils.dart';

class Account {
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
      modalSize: ModalSize(width: 900, height: 600),
      marginBottom: 50,
      body: Container(
        alignment: Alignment.center,
        height: 570,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 30, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '账户资金明细',
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
              child: AccountDetails(),
            ),
          ],
        ),
      ),
    );
  }


  static Future<bool?> DataModal(BuildContext context,
      {void Function()? onFunc}) async {
    return await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff323337),
      border: Border.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      modalSize: ModalSize(width: 700, height: 350),
      marginBottom: 50,
      body: Container(
        alignment: Alignment.center,
        height: 320,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 30, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '设置资金栏数据',
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
              child: SettingData(),
            ),
          ],
        ),
      ),
    );
  }

}
