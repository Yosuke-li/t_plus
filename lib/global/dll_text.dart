import 'package:flutter/material.dart';
import 'dart:ffi' as ffi;
import 'package:call/call.dart';

/// typedef FuncNative = ffi.Int32 Function(ffi.Int32, ffi.Int32);
/// typedef FuncDart = int Function(int, int);
///
/// var dll = getDyLibModule('assets/libadd.dll');
/// var add = dll.lookupFunction<FuncNative, FuncDart>('add');
///
/// print(add(999, 54639));
///

typedef FuncVersion = ffi.Void Function();
typedef FuncDartV = void Function();


class DllTextPage extends StatefulWidget {
  @override
  _DllTextPageState createState() => _DllTextPageState();
}

class _DllTextPageState extends State<DllTextPage> {
  dynamic version;

  @override
  void initState() {
    super.initState();
    _setVoid();
  }

  void _setVoid() {
    var dll = getDyLibModule('assets/dll/HsFutuSystemInfo.dll');
    var getVersion = dll.lookupFunction<FuncVersion, FuncDartV>('hundsun_getversion');
    print(getVersion);
    version = getVersion;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('getVersion: $version'),
      ),
    );
  }
}
