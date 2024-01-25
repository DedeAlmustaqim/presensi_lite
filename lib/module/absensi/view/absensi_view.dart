import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:presensi/core.dart';
import 'package:presensi/service/userdata_service.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AbsensiView extends StatefulWidget {
  AbsensiView({Key? key}) : super(key: key);

  Widget build(context, AbsensiController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        actions: [
          ZoomTapAnimation(
            onTap: () {
              controller.refresUserData();
            },
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
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
                "Lakukan Absensi dengan menekan tombol CHECK IN/CHEK COUT",
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
                      latitude: double.tryParse(
                              UserDataService.userData!.lat ?? "") ??
                          0.0,
                      longitude: double.tryParse(
                              UserDataService.userData!.long ?? "") ??
                          0.0,
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
                              UserDataService.userData!.nmUnit.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Radius (m) : ",
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                UserDataService.userData!.radius.toString(),
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
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
                  height: MediaQuery.of(context).size.height * 0.18,
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
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                UserDataService.userData!.img.toString(),
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
                                  UserDataService.userData!.name.toString(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "NIP : ",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      UserDataService.userData!.nip.toString(),
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  UserDataService.userData!.nmUnit.toString(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  child: Row(
                                    children: [
                                      ZoomTapAnimation(
                                        onTap: controller.isLoading
                                            ? null
                                            : () => controller.checkIn(),
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0,
                                          ),
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
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                MdiIcons.qrcodeScan,
                                                size: 12.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
                                              Text(
                                                "CHECK IN",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ZoomTapAnimation(
                                        // onTap: () {
                                        //   controller.getUser();
                                        // },
                                        onTap: controller.isLoading
                                            ? null
                                            : () {
                                                controller.checkOut();
                                              },
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            color: controller.isLoading
                                                ? disabledColor
                                                : orangeColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                MdiIcons.qrcodeScan,
                                                size: 12.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
                                              Text(
                                                "CHECK OUT",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
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
