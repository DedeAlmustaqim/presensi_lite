import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/dinas_tab_controller.dart';

class DinasTabView extends StatefulWidget {
  const DinasTabView({Key? key}) : super(key: key);

  Widget build(context, DinasTabController controller) {
    controller.view = this;
    return Scaffold(
        appBar: AppBar(
          actions: const [],
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
                Tab(
                  text: 'Tugas Dinas',
                ),
                Tab(
                  text: 'Dalam Daerah',
                ),
                Tab(
                  text: 'Luar Daerah',
                ),
              ]),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          TugasDinasView(),
          DalamDaerahView(),
          LuarDaerahView(),
        ]));
  }

  @override
  State<DinasTabView> createState() => DinasTabController();
}
