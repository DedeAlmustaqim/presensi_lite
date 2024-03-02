import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/privacy_disclaimer_controller.dart';

class PrivacyDisclaimerView extends StatefulWidget {
  const PrivacyDisclaimerView({Key? key}) : super(key: key);

  Widget build(context, PrivacyDisclaimerController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("PrivacyDisclaimer"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<PrivacyDisclaimerView> createState() => PrivacyDisclaimerController();
}
