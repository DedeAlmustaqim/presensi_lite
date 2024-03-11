import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:flutter/services.dart';

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
            ProfileView(),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Keluar dari Aplikasi ATEI..?",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primaryColor,
                              side: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Text("Ya"),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: dangerColor,
                              side: BorderSide(
                                color: dangerColor,
                              ),
                            ),
                            onPressed: () {
                              Get.offAll(MainNavigationView());
                            },
                            child: Text("Tidak"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                icon: Icon(
                  Icons.person,
                ),
                label: "Profil",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), // Icon untuk menutup aplikasi
                label: "Keluar",
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
