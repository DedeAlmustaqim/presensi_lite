import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi/core.dart';
import 'package:presensi/service/check_location.dart';
import '../view/absensi_view.dart';

class AbsensiController extends State<AbsensiView> {
  static late AbsensiController instance;
  late AbsensiView view;

  @override
  void initState() {
    instance = this;
    _checkLocationPermission();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String latitude = 'Loading...';
  String longitude = 'Loading...';
  bool isLoading = false;
  // List data = [];

  scanAbsen() async {
    setState(() {
      isLoading = true;
    });
    await _checkLocationPermission();
  }

  checkLocation() async {
    showLoading(message: "Cek Lokasi ...");
    setState(() {
      isLoading = false;
    });
    var data = await CheckLocation().checkLocation(latitude, longitude);
    // setState(() {
    //   data = data;
    // });
    if (data['success'] == true) {
      hideLoading();
      showInfoDialog("true", "Berhasil");
    } else if (data['success'] == false) {
      hideLoading();
      showInfoDialog("Anda diluar Radius Titik Absen", "Gagal");
    }
  }

  _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      });
      await checkLocation();
    } catch (e) {
      print(e);
    }
  }

  _checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status == PermissionStatus.granted) {
      // Jika izin sudah diberikan
      _getLocation();
    } else {
      // Meminta izin lokasi jika belum diberikan
      await openAppSettings();
    }
  }
}
