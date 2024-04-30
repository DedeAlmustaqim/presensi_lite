import 'package:atei_bartim/shared/util/show_loading/show_loading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:atei_bartim/shared/util/dialog/show_info_akses_dialog.dart';

class PermissionService {
  checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status != PermissionStatus.granted) {
      await showInfoAksesDialog(
          message: "Izinkan Akses Lokasi", title: "Peringatan");
      hideLoading();
      openAppSettings();
    }
  }

  checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;

    if (status != PermissionStatus.granted) {
      await showInfoAksesDialog(
          message: "Izinkan Akses Kamera", title: "Peringatan");
      hideLoading();
      openAppSettings();
    }
  }
}
