import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

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
            TppView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 10,
            iconSize: 24,
            backgroundColor: Theme.of(context).primaryColorLight,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex,
            onTap: (newIndex) {
              controller.updateIndex(newIndex);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.qrcodePlus),
                label: "Absen",
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.chartBar),
                label: "Skor Disiplin",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profil",
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
