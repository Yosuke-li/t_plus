import 'package:flutter/material.dart';
import 'package:transaction_plus/page/order/order_submit/view.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/management/common/view_key.dart';
import 'package:transaction_plus/widget/management/widget/custom_expansion_tile.dart';
import 'dart:math' as math;

import 'editor.dart';

class Tool extends StatefulWidget {
  final EditorController controller;

  const Tool({Key key, this.controller}) : super(key: key);

  @override
  _ToolState createState() => _ToolState();
}

class _GroupItem {
  final String title;
  final VoidCallback callback;

  _GroupItem(this.title, this.callback);
}

class _ToolState extends State<Tool> {
  final Map<String, bool> expanded = <String, bool>{};

  void _handlePromotionalInfoTap() {
    widget.controller.open(
        key: ConstViewKey.promotionalInfo,
        tab: '下单',
        contentIfAbsent: (_) => OrderSubmitPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[350],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            type: MaterialType.transparency,
            child: buildToolGroup(
              groupName: '首页',
              callback: () {
                NavigatorUtils.pop(context);
              },
              icon: Container(
                width: screenUtil.adaptive(10),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: buildToolGroup(
                groupName: '下单',
                groupItems: [_GroupItem('下单', _handlePromotionalInfoTap)]),
          ),
        ],
      ),
    );
  }

  Widget buildToolGroup(
      {String groupName,
      List<_GroupItem> groupItems,
      VoidCallback callback,
      Widget icon}) {
    assert(groupItems?.isNotEmpty == true || callback != null);
    return CustomExpansionTile(
      value: expanded[groupName] == true,
      customHead: (_, animation) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              icon ??
                  Transform.rotate(
                    angle: math.pi * (1.5 + animation.value / 2),
                    child: const Icon(
                      Icons.expand_more,
                      size: 16,
                    ),
                  ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  groupName,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          if (callback != null) {
            callback?.call();
          } else {
            if (expanded[groupName] == null) {
              expanded[groupName] = true;
            } else {
              expanded[groupName] = !expanded[groupName];
            }
          }
          setState(() {});
        },
      ),
      children: groupItems
              ?.map((e) => InkWell(
                    onTap: e.callback,
                    child: Container(
                      padding: const EdgeInsets.all(8.0).copyWith(left: 32),
                      alignment: Alignment.centerLeft,
                      child: Text(e.title),
                    ),
                  ))
              ?.toList(growable: false) ??
          [],
    );
  }
}
