import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  Widget build(context, SplashScreenController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ATEI BARTIM",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/icon/icon.png",
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      minHeight: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Mohon tunggu",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Mengecek Koneksi Anda ke Server dan Versi Aplikasi",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}
