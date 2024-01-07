import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../controller/absensi_controller.dart';

class AbsensiView extends StatefulWidget {
  AbsensiView({Key? key}) : super(key: key);

  Widget build(context, AbsensiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.04,
        backgroundColor: primaryColor,
        title: Container(
          child: Column(
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
                "Lakukan Absensi dengan menekan tombol SCAN",
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
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
                top: 20,
                right: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      height: 85,
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                MdiIcons.pin,
                                color: Colors.red,
                                size: 16.0,
                              ),
                              Text(
                                "Titik Lokasi Absensi",
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Expanded(
                            child: Text(
                              "Badan Perencanaan Pembangunan dan Pengembangan Litbang Daerah",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Text(
                            "Radius : 100 m",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        showLoading();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: Colors.white,
                        ),
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.map,
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Buka Map",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
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
                                  child: ZoomTapAnimation(
                                    onTap: controller.isLoading
                                        ? null
                                        : () => controller.scanAbsen(),
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        color: controller.isLoading
                                            ? disabledColor
                                            : primaryColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.qr_code,
                                            size: 24.0,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "SCAN",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
        ),
      ),
    );
  }

  State<AbsensiView> createState() => AbsensiController();
}
