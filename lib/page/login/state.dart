import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {
  GlobalKey<FormState> formKey;
  TextEditingController nameController;
  TextEditingController passController;
  RxBool isRead; //阅读协议

  RxString name; // 账户
  RxString password; //密码s
  RxString server; //服务器

  List<String> servers; //服务器列表

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
