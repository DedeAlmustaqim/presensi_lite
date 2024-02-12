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
        message: "Anda diluar radius titik absen",
        title: "Gagal",
        icon: Icon(
          Icons.info_outline,
          size: 24.0,
          color: orangeColor,
        ),
      );
    }
  }

  checkOut() async {
    setState(() {
      isLoading = true;
    });

    var user = await checkPermisionLokasi();

    if (user['success'] == true) {
      hideLoading();
      _postCheckOut();
    } else if (user['success'] == false) {
      hideLoading();
      showInfoDialog(
        message: "Anda diluar radius titik absen",
        title: "Gagal",
        icon: Icon(
          Icons.info_outline,
          size: 24.0,
          color: orangeColor,
        ),
      );
    }
  }

  checkPermisionLokasi() async {
    setState(() {
      isLoading = false;
    });
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
        message: "$msg",
        title: "$judul",
        icon: success
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
      HadirListController.instance.getRekap();
      DashboardController.instance.getToday();
    } catch (e) {
      showInfoDialog(
        message: "Terjadi Kesalahan",
        title: "Error",
        icon: Icon(
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

  void _postCheckOut() async {
    final result = await BarcodeScanner.scan();
    try {
      var postQr = await ScanQr().postQrOut(result.rawContent);
      bool success = postQr['success'];
      String judul = postQr['judul'];
      String msg = postQr['msg'];

      showInfoDialog(
        message: "$msg",
        title: "$judul",
        icon: success
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
      HadirListController.instance.getRekap();
      DashboardController.instance.getToday();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showInfoDialog(
        message: "Terjadi kesalahan",
        title: "Error",
        icon: Icon(
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

  refresUserData() async {
    showLoading();
    await UserDataService.getUser();
    setState(() {
      userData = UserDataService.userData;
    });
    hideLoading();
  }
}
