import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/tms_fullday_controller.dart';

class TmsFulldayView extends StatefulWidget {
  const TmsFulldayView({Key? key}) : super(key: key);

  Widget build(context, TmsFulldayController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TmsFullday"),
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
  State<TmsFulldayView> createState() => TmsFulldayController();
}
