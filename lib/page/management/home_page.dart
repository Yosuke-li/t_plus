import 'package:flutter/material.dart';
import 'package:transaction_plus/page/management/tool.dart';

import 'editor.dart';

class ManagePage extends StatefulWidget {
  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final EditorController editorController = EditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('管理后台'),
      ),
      body: Row(
        children: [
          Tool(
            controller: editorController,
          ),
          Expanded(
            child: Editor(
              controller: editorController,
            ),
          )
        ],
      ),
    );
  }
}
