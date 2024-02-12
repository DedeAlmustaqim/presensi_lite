import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class UbahPassView extends StatefulWidget {
  UbahPassView({Key? key}) : super(key: key);

  Widget build(context, UbahPassController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Password"),
        actions: [],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              QTextField(
                helper: "Minimal 8 Karakter",
                label: "Password Baru",
                validator: Validator.required,
                value: null,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UbahPassView> createState() => UbahPassController();
}
