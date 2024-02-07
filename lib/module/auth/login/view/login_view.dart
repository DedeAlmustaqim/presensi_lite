import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: primaryColor,
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
                    Text(
                      "ATEI BARTIM",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      "assets/icon/icon.png",
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: TextFormField(
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "NIK",
                          suffixIcon: Icon(
                            MdiIcons.cardAccountDetails,
                          ),
                        ),
                        onChanged: (value) {
                          controller.nik = value;
                        },
                      ),
                    ),
                    QTextFieldPass(
                      label: "Password",
                      obscure: controller.isVisible,
                      validator: Validator.required,
                      suffixIcon: !controller.isVisible
                          ? Icons.remove_red_eye
                          : MdiIcons.eyeLock,
                      value: controller.password,
                      onChanged: (value) {
                        controller.password = value;
                        // DB.set("password", value);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.login),
                      label: const Text("Login"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        controller.doLogin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Powered by",
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            "Digital Native",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            'Versi ${AppConfig.version.toString()}',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
