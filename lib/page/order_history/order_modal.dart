import 'package:flutter/material.dart';

import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/widget/modal_utils.dart';

import 'order_history_more.dart';

class OrderHModal {
  static Future<void> Modal(BuildContext context) async {
    await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff323337),
      border: Border.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      modalSize: ModalSize(width: 900, height: 400),
      body: Container(
        alignment: Alignment.center,
        height: 400,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '成交单历史',
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        NavigatorUtils.pop(context);
                      },
                      child: const Icon(Icons.close),
                    )
                  ],
                )
            ),
            const Expanded(
              child: OrderHistoryMore(),
            ),
          ],
        ),
      ),
    );
  }

}