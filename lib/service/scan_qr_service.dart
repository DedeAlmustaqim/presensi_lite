import 'package:presensi/core.dart';

class ScanQr {
  final url = AppConfig.baseUrl;
  static Dio dio = Diointerceptors.dio;
  checkLocation(String lat, String long) async {
    var response = await Dio().post(
      "$url/api/user/verifikasi_loc",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {"id": AppConfig.idUser, "latitude": "$lat", "longitude": "$long"},
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
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "qr_in": qrIn,
        "id": AppConfig.idUser,
      },
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future postQrOut(String qrOut) async {
    var response = await Dio().post(
      "$url/api/user/qr_out",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "qr_out": qrOut,
        "id": AppConfig.idUser,
      },
    );
    Map obj = response.data;
    return obj['data'];
  }
}
