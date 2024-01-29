import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                      obscure: controller.isVisible,
                      validator: Validator.required,
                      suffixIcon: Icons.password,
                      value: controller.password,
                      onChanged: (value) {
                        controller.password = value;
                        // DB.set("password", value);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.showPass();
                          },
                          child: Text(
                            "Tampilkan Password",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    QButton(
                      label: "Login",
                      onPressed: () => controller.doLogin(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
