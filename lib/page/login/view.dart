import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:transaction_plus/global/dll_text.dart';
import 'package:transaction_plus/global/event.dart';
import 'package:transaction_plus/global/global.dart';
import 'package:transaction_plus/helper/security_keyboard.dart';
import 'package:transaction_plus/utils/event_bus_helper.dart';
import 'package:transaction_plus/utils/navigator.dart';
import 'package:transaction_plus/utils/screen.dart';
import 'package:transaction_plus/widget/common/main.dart';
import 'package:transaction_plus/widget/down_menu.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext ctx) => Container(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(ctx).openDrawer();
                },
                child: Icon(Icons.settings),
              ),
            ),
          ),
        ),
        title: Text('奥统平技术有限公司'),
        actions: [
          GestureDetector(
            onTap: () {
              NavigatorUtils.pushWidget(context, DockingMainPage());
              // NavigatorUtils.pushWidget(context, MouseTextPage());
              // NavigatorUtils.pushWidget(context, DllTextPage());
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(right: screenUtil.adaptive(50)),
                child: Text('测试'),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Form(
            key: state.formKey,
            child: Obx(
                  () => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 300.0,
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Row(
                      children: [
                        Text('服务器：'),
                        Expanded(
                          child: DownMenuWidget<String>(
                            select: state.server.value,
                            menus: state.servers,
                            selectFunc: (String value) {
                              state.server.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ClipRRect(
                    child: Container(
                      width: 300.0,
                      padding: EdgeInsets.only(right: 20, left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: TextFormField(
                        keyboardType: SecurityKeyboardCenter.number,
                        controller: state.nameController,
                        decoration: new InputDecoration(
                          labelText: '账户',
                        ),
                        onSaved: (String? val) {
                          state.name.value = val!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ClipRRect(
                    child: Container(
                      width: 300.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        controller: state.passController,
                        keyboardType: SecurityKeyboardCenter.text,
                        decoration: InputDecoration(
                          labelText: '密码',
                        ),
                        onSaved: (String? val) {
                          state.password.value = val!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      logic.login();
                    },
                    child: Text(
                      "登录",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: state.isRead.value,
                        onChanged: (bool? value) {
                          state.isRead.value = value!;
                        },
                      ),
                      Text(
                        "我已阅读并同意《服务协议》及《隐私政策》",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawerEdgeDragWidth: 0.0,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('设置'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: Global.isMqttLog,
                  onChanged: (bool? value) {
                    Global.isMqttLog = value!;
                    setState(() {});
                  },
                ),
                Text(
                  "是否打开MQTT LOG",
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: Global.isDarkTheme,
                  onChanged: (bool? value) {
                    EventBusHelper.asyncStreamController!.add(EventCache()..isDarkTheme = value!);
                    setState(() {});
                  },
                ),
                Text(
                  "切换主题",
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: Global.isFiddle,
                  onChanged: (bool? value) {
                    Global.isFiddle = value!;
                    setState(() {});
                  },
                ),
                Text(
                  "是否打开Fiddle抓包, 地址：",
                  style: TextStyle(fontSize: 13.0),
                ),
                Expanded(
                  child: TextFormField(
                    readOnly: Global.isFiddle == false,
                    keyboardType: TextInputType.number,
                    initialValue: Global.fiddleIp,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                    ],
                    decoration:
                    InputDecoration(hintText: '例如：192.168.1.101'),
                    onChanged: (String val) {
                      Global.fiddleIp = val;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  width: screenUtil.adaptive(10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}
