import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/log_utils.dart';

class MouseTextPage extends StatefulWidget {

  @override
  _MouseTextState createState() => _MouseTextState();
}

class _MouseTextState extends State<MouseTextPage> {

  // 鼠标右键
  Future<void> _onPointerDown(PointerDownEvent event) async {
    List<PopupMenuItem<int>> menuItems = <PopupMenuItem<int>>[
      PopupMenuItem(child: Text('apply +1'), value: 1),
      PopupMenuItem(child: Text('apply -1'), value: 2),
      PopupMenuItem(child: Text('set to 0'), value: 3),
    ];


    if (event.kind == PointerDeviceKind.mouse &&
        event.buttons == kSecondaryMouseButton) {
      Log.info(event);
      final overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
      final menuItem = await showMenu<int>(
          context: context,
          items: menuItems,
          position: RelativeRect.fromSize(
              event.position & Size(48.0, 48.0), overlay.size));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('textField text'),
      ),
      body: Center(
        child: Listener(
          onPointerDown: (event) {
            _onPointerDown(event);
          },
          child: MouseRegion(
            onEnter: (PointerEnterEvent event) {
              Log.info('onEnter: $event');
            },
            onHover: (PointerHoverEvent event) {
              Log.info('onHover: $event');
            },
            onExit: (PointerExitEvent event) {
              Log.info('onExit: $event');
            },
            opaque: false,
            cursor: SystemMouseCursors.click,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}