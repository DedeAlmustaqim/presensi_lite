import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/tms_tab_controller.dart';

class TmsTabView extends StatefulWidget {
  const TmsTabView({Key? key}) : super(key: key);

  Widget build(context, TmsTabController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TmsTab"),
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
  State<TmsTabView> createState() => TmsTabController();
}
