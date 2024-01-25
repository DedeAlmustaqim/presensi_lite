import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        // title: Text("controller.user!.name.toString()"),
        title: Text("Presensi Login"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                QTextField(
                  label: "Email",
                  validator: Validator.email,
                  suffixIcon: Icons.email,
                  value: controller.email,
                  onChanged: (value) {
                    controller.email = value;
                    // DB.set("email", value);
                  },
                ),
                QTextField(
                  label: "Password",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: controller.password,
                  onChanged: (value) {
                    controller.password = value;
                    // DB.set("password", value);
                  },
                ),
                QButton(
                  label: "Login",
                  onPressed: () => controller.doLogin(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
