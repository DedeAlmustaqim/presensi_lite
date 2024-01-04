import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import '../controller/absensi_controller.dart';

class AbsensiView extends StatefulWidget {
  AbsensiView({Key? key}) : super(key: key);

  Widget build(context, AbsensiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Absensi",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            Text(
              "Lakukan Absensi dengan menekan tombol scan absen masuk/pulang",
              style: TextStyle(
                fontSize: 9.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Titik Lokasi Absen",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      QLocationPicker(
                        enableEdit: false,
                        id: "location",
                        latitude: -2.1694967326176386,
                        longitude: 115.2223670529902,
                        onChanged: (latitude, longitude) {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left:
                      20, // Set left ke 0 agar widget berada di tengah secara horizontal
                  right:
                      20, // Set right ke 0 agar widget berada di tengah secara horizontal
                  child: Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 11),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      height: 100.0,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1541823709867-1b206113eafd?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Miss Queen",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Senior Developer",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "Digital Native Development",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.qr_code,
                                                size: 16.0,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                "Masuk",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: orangeColor,
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.qr_code,
                                                size: 16.0,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                "Keluar",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  State<AbsensiView> createState() => AbsensiController();
}
