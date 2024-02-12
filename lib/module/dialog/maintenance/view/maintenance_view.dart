import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:flutter/services.dart';

class MaintenanceView extends StatefulWidget {
  const MaintenanceView({Key? key}) : super(key: key);

  Widget build(context, MaintenanceController controller) {
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
                    MdiIcons.serverNetworkOff,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      "Sepertinya anda tidak terhubung ke Server kami",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Mohon periksa koneksi internet anda atau coba lagi dalam beberapa saat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.exit_to_app_rounded),
                label: const Text("Keluar"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
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
  State<MaintenanceView> createState() => MaintenanceController();
}
