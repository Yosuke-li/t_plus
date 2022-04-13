import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class MiraiDropdownWidget<T> extends StatelessWidget {
  const MiraiDropdownWidget({
    Key? key,
    required this.valueNotifier,
    required this.itemWidget,
    required this.children,
    required this.onChanged,
    this.underline = false,
    this.showSeparator = true,
    this.exit = MiraiExit.fromAll,
    this.chevronDownColor,
    this.dropdownChild,
    this.showMode = MiraiShowMode.bottom,
  }) : super(key: key);

  final ValueNotifier<String> valueNotifier;
  final MiraiDropdownBuilder<T> itemWidget;
  final List<T> children;
  final ValueChanged<T> onChanged;
  final bool underline;
  final bool showSeparator;
  final MiraiExit exit;
  final Color? chevronDownColor;
  final Widget? dropdownChild;
  final MiraiShowMode showMode;

  @override
  Widget build(BuildContext context) {
    return MiraiPopupMenu<T>(
      key: UniqueKey(),
      enable: true,
      space: 4,
      showMode: showMode,
      exit: exit,
      showSeparator: showSeparator,
      child: Container(
        key: GlobalKey(),
        padding: const EdgeInsets.only(right: 0, left: 14),
        decoration: BoxDecoration(
          borderRadius: underline ? null : BorderRadius.circular(5.0),
          border: underline
              ? const Border(
            bottom: BorderSide(
              width: 1.0,
              color: Color(0xff797979),
            ),
          )
              : Border.all(
            color: Color(0xff797979),
            width: 1.5,
          ),
        ),
        height: 35,
        child: dropdownChild ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ValueListenableBuilder<String>(
                    valueListenable: valueNotifier,
                    builder: (_, String chosenTitle, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        child: Text(
                          chosenTitle,
                          key: ValueKey(chosenTitle.trim()),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
      ),
      children: children,
      itemWidget: itemWidget,
      onChanged: onChanged,
    );
  }
}

class MiraiDropDownItemWidget extends StatelessWidget {
  const MiraiDropDownItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
      child: Text(
        item,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}