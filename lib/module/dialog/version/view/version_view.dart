import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class VersionView extends StatefulWidget {
  VersionView({Key? key}) : super(key: key);

  Widget build(context, VersionController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ATEI BARTIM",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                "assets/icon/icon.png",
                width: 120.0,
                height: 120.0,
                fit: BoxFit.fill,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Pembaharuan Aplikasi Tersedia",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Mohon untuk melakukan Update agar tetap dapat menggunakan Aplikasi ATEI BARTIM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Versi tersedia : ${VersiService.version}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text("Update Sekarang"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Powered by",
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            "Digital Native",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            'Versi ${AppConfig.version.toString()}',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<VersionView> createState() => VersionController();
}