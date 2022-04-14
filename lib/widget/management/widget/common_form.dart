import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:transaction_plus/utils/array_helper.dart';
import 'package:transaction_plus/widget/management/common/function_util.dart';

FormColumn<T> buildTextFormColumn<T>(
    {required Widget title, required String text(T value)}) {
  return FormColumn<T>(
      title: title, builder: (_, T value) => Text(text(value)));
}

FormColumn<T> buildButtonFormColumn<T>(
    {required Widget title, required String text(T value), InFunc<T>? onTap}) {
  return FormColumn<T>(
    title: title,
    builder: (_, T value) => ElevatedButton(
      child: Text(text(value)),
      onPressed: onTap == null
          ? null
          : () {
              onTap(value);
            },
    ),
  );
}

FormColumn<T> buildIconButtonFormColumn<T>(
    {required Widget title, IconData? icon, InFunc<T>? onTap}) {
  return FormColumn<T>(
      title: title,
      builder: (_, T value) => IconButton(
            icon: Icon(icon),
            onPressed: onTap == null
                ? null
                : () {
                    onTap(value);
                  },
          ));
}

class FormColumn<T> {
  final Widget title;
  final double? width;
  final Widget Function(BuildContext context, T value) builder;

  FormColumn({required this.title, required this.builder, this.width});
}

/// 点击的回调方法[onTapFunc]
///
///
/// 拖拽的回调方法[onDragFunc]，按需选择是否实现
/// [value]当前的值，[index]拖拽到当前位置的索引
///
/// 鼠标右键的回调方法[onMouseEvent]
/// [event]获取鼠标位置 [index]获取当前点击的索引
/// Future<void> onMouseEvent(PointerDownEvent event, int index) async {
///        Log.info(event);
///        Log.info(index);
///  }
///

class CommonForm<T> extends StatefulWidget {
  final List<FormColumn<T>> columns;
  final List<T> values;
  final bool? canDrag;
  final void Function(T value)? onTapFunc; //点击回调
  final void Function(T value, int index)? onDragFunc; //拖拽后的回调
  final double height;
  final Color? titleColor;
  final Color? formColor;

  final RightMenuFunc? rightMenuFunc; // 鼠标右键方法

  const CommonForm(
      {Key? key,
      required this.columns,
      required this.values,
      this.canDrag,
      this.onDragFunc,
      this.onTapFunc,
      this.titleColor,
      this.rightMenuFunc,
      this.formColor,
      required this.height})
      : super(key: key);

  @override
  _CommonFormState<T> createState() => _CommonFormState<T>();
}

class _CommonFormState<T> extends State<CommonForm<T>> {
  ScrollController hController = ScrollController();
  ScrollController vController = ScrollController();

  bool shouldReact = false;

  Widget buildTitleRow() {
    return Container(
      decoration: BoxDecoration(color: widget.titleColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.columns
            .map((e) => warpWidget(child: e.title, width: e.width))
            .toList(growable: false),
      ),
    );
  }

  ///可拖拽
  Widget buildDragTitleRow(int index) {
    return LongPressDraggable(
      data: index,
      child: DragTarget<int>(
        onAccept: (data) {
          final temp = widget.values[data];
          setState(() {
            widget.values.remove(temp);
            widget.values.insert(index, temp);
          });
          widget.onDragFunc?.call(temp, index);
        },
        //绘制widget
        builder: (context, data, rejects) {
          return buildRow(ArrayHelper.get(widget.values, index)!);
        },
      ),
      feedback: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Colors.red),
        ),
        child: buildRow(ArrayHelper.get(widget.values, index)!),
      ),
    );
  }

  ///实现table的每一行
  Widget buildRow(T value) {
    return Listener(
      onPointerDown: (e) {
        shouldReact = e.kind == PointerDeviceKind.mouse &&
            e.buttons == kSecondaryMouseButton;
      },
      onPointerUp: (e) async {
        if (!shouldReact) return;
        shouldReact = false;

        final position = Offset(
          e.position.dx + Offset.zero.dx,
          e.position.dy + Offset.zero.dy,
        );

        final selectedItem = await showContextMenu(
          ShowMenuArgs(
            MediaQuery.of(context).devicePixelRatio,
            position,
            widget.rightMenuFunc?.menuItems ?? [],
          ),
        );

        if (selectedItem != null) {
          widget.rightMenuFunc?.onItemSelected
              ?.call(selectedItem, widget.values.indexOf(value));
        }
      },
      child: Container(
        decoration: BoxDecoration(color: widget.formColor),
        child: GestureDetector(
          onTap: () {
            widget.onTapFunc?.call(value);
          },
          child: Row(
            children: widget.columns
                .map((e) => warpWidget(
                    child: e.builder(context, value), width: e.width))
                .toList(growable: false),
          ),
        ),
      ),
    );
  }

  Widget warpWidget({required Widget child, Color? color, double? width}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Color(0xE6797979)),
          color: color),
      height: 25,
      width: width ?? 125,
      padding: const EdgeInsets.all(4),
      alignment: Alignment.center,
      child: RepaintBoundary(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    if (widget.canDrag == true) {
      for (int x = 0; x < widget.values.length; x++) {
        children.add(buildDragTitleRow(x));
      }
    } else {
      children.addAll(widget.values.map((e) => buildRow(e)));
    }

    return Scrollbar(
      controller: hController,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: hController,
        child: Container(
          height: widget.height,
          child: Column(
            children: [
              buildTitleRow(),
              Expanded(
                child: Scrollbar(
                  controller: vController,
                  child: SingleChildScrollView(
                    controller: vController,
                    child: Column(
                      children: children,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RightMenuFunc {
  List<MenuItem>? menuItems;
  void Function(MenuItem item, int index)? onItemSelected;

  RightMenuFunc({this.menuItems, this.onItemSelected});
}
