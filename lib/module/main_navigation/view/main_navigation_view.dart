import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            DashboardView(),
            AbsensiView(),
            HadirListView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColorLight,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex,
            onTap: (newIndex) => controller.updateIndex(newIndex),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.viewDashboard,
                ),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.qrcodePlus),
                label: "Absen",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_available),
                label: "Kehadiran",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
