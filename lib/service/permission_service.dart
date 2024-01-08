import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status != PermissionStatus.granted) {
      await openAppSettings();
    }
  }

  checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;

    if (status != PermissionStatus.granted) {
      await openAppSettings();
    }
  }
}
