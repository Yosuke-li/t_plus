import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController passController;
  late RxBool isRead; //阅读协议

  late RxString name; // 账户
  late RxString password; //密码s
  late RxString server; //服务器

  late List<String> servers; //服务器列表

  LoginState() {
    name = ''.obs;
    isRead = false.obs;
    password = ''.obs;
    server = ''.obs;
    servers = <String>[];
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    passController = TextEditingController();
  }
}
