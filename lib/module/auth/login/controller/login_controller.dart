import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

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
  String? nik;
  String? password;
  String? token;
  String? idUser;
  bool isVisible = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  doLogin() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    showSpin();

    await AuthService().login(
      nik: nik!,
      password: password!,
      context: context,
    );
  }

  showPass() async {
    isVisible = !isVisible;
    setState(() {});
  }

  clearData() {
    DB.clearDatabase();
  }
}
