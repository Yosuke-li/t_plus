import 'package:flutter/material.dart';
import 'package:transaction_plus/page/order/order_select.dart';
import 'package:transaction_plus/utils/navigator.dart';

import '../../widget/modal_utils.dart';

class Order {
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
      marginBottom: 20,
      ModalSize: ModalSize(width: null, height: 510),
      body: Container(
        alignment: Alignment.center,
        height: 470,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 30, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '选择合约',
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
              child: OrderSelect(),
            ),
          ],
        ),
      ),
    );
  }
}
