import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/kehadiran_tab_controller.dart';

class KehadiranTabView extends StatefulWidget {
  const KehadiranTabView({Key? key}) : super(key: key);

  Widget build(context, KehadiranTabController controller) {
    controller.view = this;
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              indicatorWeight: 2,
              tabAlignment: TabAlignment.center,
              indicatorColor: Colors.white,
              dividerColor: Colors.white,
              unselectedLabelColor: Colors.white38,
              labelColor: Colors.white,
              isScrollable: true,
              controller: controller.tabController,
              tabs: [
                Tab(text: "Kehadiran"),
                Tab(text: "Tugas/Dinas"),
                Tab(text: "Izin"),
                Tab(text: "Cuti"),
              ]),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          HadirListView(),
          HadirListView(),
          HadirListView(),
          HadirListView(),
        ]));
  }

  @override
  State<KehadiranTabView> createState() => KehadiranTabController();
}
