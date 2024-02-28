import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/tmk_tab_controller.dart';

class TmkTabView extends StatefulWidget {
  const TmkTabView({Key? key}) : super(key: key);

  Widget build(context, TmkTabController controller) {
    controller.view = this;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tidak Masuk Kerja"),
          actions: const [],
          bottom: TabBar(
              indicatorColor: Colors.white,
              dividerColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              labelColor: Colors.white,
              controller: controller.tabController,
              tabs: [
                Tab(text: "TMK 1 Hari"),
                Tab(text: "> TMK 1 Hari"),
              ]),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          TmkFulldayView(),
          TmkMoredayView(),
        ]));
  }

  @override
  State<TmkTabView> createState() => TmkTabController();
}
