import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:atei_bartim/core.dart';
import 'package:atei_bartim/models/user_detail.dart';

class AbsensiController extends State<AbsensiView> {
  static late AbsensiController instance;
  late AbsensiView view;
  String latitude = 'Loading...';
  String longitude = 'Loading...';
  bool isLoading = false;
  UserDetail? userData = UserDataService.userData;

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
    showSpin();
    var user = await checkPermisionLokasi();

    if (user['success'] == true) {
      _postCheckIn();
    } else if (user['success'] == false) {
      return NotifCherryToast()
          .toastInfo("Anda diluar radius titik absen", context);
    }
  }

  checkOut() async {
    showSpin();
    var user = await checkPermisionLokasi();

    if (user['success'] == true) {
      _postCheckOut();
    } else if (user['success'] == false) {
      return NotifCherryToast()
          .toastInfo("Anda diluar radius titik absen", context);
    }
  }

  checkPermisionLokasi() async {
    await PermissionService().checkLocationPermission();
    await PermissionService().checkCameraPermission();

    Position position = await LocationService().getLocation();

    if (position.isMocked) {
      hideLoading();
      return NotifCherryToast()
          .toastError("Anda terdeteksi menggunakan lokasi palsu", context);
    } else {
      hideLoading();
      var user = await ScanQr().checkLocation(
          position.latitude.toString(), position.longitude.toString(), context);

      return user;
    }
  }

  void _postCheckIn() async {
    try {
      final result = await BarcodeScanner.scan();

      var postQr = await ScanQr().postQrIn(result.rawContent);
      bool success = postQr['success'];
      String judul = postQr['judul'];
      String msg = postQr['msg'];
      if (success) {
        // return NotifCherryToast().toastSuccess("$judul" " $msg", context);
        return showInfoDialog(message: "$msg", title: "$judul");
      } else {
        return showInfoDialog(message: "$msg", title: "$judul");
      }
    } catch (e) {
      return showInfoDialog(message: "Terjadi Kesalahan", title: "Gagal");
    }
  }

  void _postCheckOut() async {
    try {
      final result = await BarcodeScanner.scan();
      var postQr = await ScanQr().postQrOut(result.rawContent);
      bool success = postQr['success'];
      String judul = postQr['judul'];
      String msg = postQr['msg'];

      if (success) {
        return showInfoDialog(message: "$msg", title: "$judul");
      } else {
        return showInfoDialog(message: "$msg", title: "$judul");
      }
    } catch (e) {
      return showInfoDialog(message: "Terjadi Kesalahan", title: "Gagal");
    }
  }

  refresUserData() async {
    showSpin();
    await UserDataService.getUser();
    setState(() {
      userData = UserDataService.userData;
    });
    hideLoading();
  }
}
