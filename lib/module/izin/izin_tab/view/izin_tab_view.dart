import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class IzinTabView extends StatefulWidget {
  const IzinTabView({Key? key}) : super(key: key);

  Widget build(context, IzinTabController controller) {
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
                Tab(
                  text: 'Izin Satu Hari',
                ),
                Tab(
                  text: 'Izin Lebih Satu Hari',
                ),
              ]),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          IzinDayView(),
          IzinMoreDayView(),
        ]));
  }

  @override
  State<IzinTabView> createState() => IzinTabController();
}
