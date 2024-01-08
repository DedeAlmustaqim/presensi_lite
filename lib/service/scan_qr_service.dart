import 'package:presensi/core.dart';

class ScanQr {
  final url = AppConfig.baseUrl;

  checkLocation(String lat, String long) async {
    var response = await Dio().post(
      "$url/api/user/verifikasi_loc",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {"id": "1", "latitude": "$lat", "longitude": "$long"},
    );
    Map<String, dynamic> obj = response.data;

    return obj['data'];
  }

  Future postQrIn(String qrIn) async {
    var response = await Dio().post(
      "$url/api/user/qr_in",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "qr_in": qrIn,
        "id": "1",
      },
    );
    Map obj = response.data;
    return obj['data'];
  }
}
