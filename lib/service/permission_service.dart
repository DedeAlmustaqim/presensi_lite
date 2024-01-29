import 'package:permission_handler/permission_handler.dart';
import 'package:presensi/shared/util/dialog/show_info_akses_dialog.dart';

class PermissionService {
  checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status != PermissionStatus.granted) {
      showInfoAksesDialog(message: "Izinkan Akses Lokasi", title: "");
      openAppSettings();
    }
  }

  checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;

    if (status != PermissionStatus.granted) {
      showInfoAksesDialog(message: "Izinkan Akses Kamera", title: "");
      openAppSettings();
    }
  }
}
