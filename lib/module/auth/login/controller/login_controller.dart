import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:presensi/model/user_model.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    DB.init();
    // email = DB.get("email");
    // password = DB.get("password");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? email;
  String? password;
  String? token;
  String? idUser;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  doLogin() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    showLoading();
    await AuthService().login(
      email: email!,
      password: password!,
    );
    hideLoading();

    // Get.offAll(MainNavigationView());
  }

  clearData() {
    DB.clearDatabase();
  }
}
