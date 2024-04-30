import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/tms_moreday_controller.dart';

class TmsMoredayView extends StatefulWidget {
  const TmsMoredayView({Key? key}) : super(key: key);

  Widget build(context, TmsMoredayController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TmsMoreday"),
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
  State<TmsMoredayView> createState() => TmsMoredayController();
}
