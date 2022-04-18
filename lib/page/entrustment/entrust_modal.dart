import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/widget/modal_utils.dart';

class EntrustModal {
  static Future<void> Modal(BuildContext context,
      {required Widget child, required String title, ModelSize? size,}) async {
    await ModalUtils.showModal(
      context,
      modalBackgroundColor: const Color(0xff323337),
      border: Border.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      modelSize: size ?? ModelSize(width: null, height: 510),
      body: Container(
        alignment: Alignment.center,
        height: size != null ? (size.height ?? 0 - 30) : 470,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 30, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${title}',
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
              child: child,
            ),
          ],
        ),
      ),
    );
  }

}