import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class LogoutConfirmView extends StatefulWidget {
  LogoutConfirmView({Key? key}) : super(key: key);

  Widget build(context, LogoutConfirmController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi Logout"),
        actions: [],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Kebijakan Login dan Logout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Kami telah menambahkan kebijakan dalam fungsi login dan logout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Sekarang setiap kali anda logout kami akan membatasi akun anda untuk login kembali setelah 12 jam",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 100.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        controller.doLogout();
                      },
                      child: const Text(
                        "Ya Saya tetap Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Get.to(MainNavigationView());
                      },
                      child: const Text(
                        "Batalkan Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LogoutConfirmView> createState() => LogoutConfirmController();
}
