import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:presensi/core.dart';
import 'package:presensi/service/location_service.dart';
import 'package:presensi/service/permission_service.dart';
import 'package:presensi/service/scan_qr_service.dart';

class AbsensiController extends State<AbsensiView> {
  static late AbsensiController instance;
  late AbsensiView view;
  String latitude = 'Loading...';
  String longitude = 'Loading...';
  bool isLoading = false;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  @override
  void dispose() => super.dispose();

  checkIn() async {
    setState(() {
      isLoading = true;
    });

    var user = await checkPermisionLokasi();

    if (user['success'] == true) {
      hideLoading();
      _postCheckIn();
    } else if (user['success'] == false) {
      hideLoading();
      showInfoDialog(
        "Anda diluar radius titik absen",
        "Gagal",
        Icon(
          Icons.warning,
          size: 50.0,
          color: orangeColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  Future checkPermisionLokasi() async {
    await PermissionService().checkLocationPermission();
    await PermissionService().checkCameraPermission();
    Position position = await LocationService().getLocation();

    showLoading(message: "Cek Lokasi ...");

    var user = await ScanQr().checkLocation(
        position.latitude.toString(), position.longitude.toString());

    return user;
  }

  void _postCheckIn() async {
    final result = await BarcodeScanner.scan();
    try {
      var postQr = await ScanQr().postQrIn(result.rawContent);
      bool success = postQr['success'];
      String judul = postQr['judul'];
      String msg = postQr['msg'];

      showInfoDialog(
        "$msg",
        "$judul",
        success
            ? Icon(
                Icons.check,
                size: 60.0,
                color: successColor,
              )
            : Icon(
                Icons.warning_amber,
                size: 60.0,
                color: orangeColor,
              ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showInfoDialog(
        "Terjadi kesalahan",
        "Error",
        const Icon(
          Icons.error,
          size: 60.0,
          color: Colors.red,
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }
}
