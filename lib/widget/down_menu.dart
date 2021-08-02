import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/screen.dart';

class DownMenuWidget<T> extends StatefulWidget {
  T select;
  List<T> menus;
  void Function(T value) selectFunc;

  DownMenuWidget({this.menus, this.selectFunc, this.select});

  @override
  _DownMenuWidget createState() => _DownMenuWidget();
}

class _DownMenuWidget<T> extends State<DownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<T>(
          value: widget.select ?? widget.menus[0],
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, size: screenUtil.adaptive(24),),
          items: widget.menus?.map((e) {
                return DropdownMenuItem<T>(child: Text('$e'), value: e);
              })?.toList() ??
              [],
          onChanged: (T value) {
            widget.selectFunc?.call(value);
          },
      ),
    );
  }
}
