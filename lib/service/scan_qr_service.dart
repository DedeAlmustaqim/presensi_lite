import 'package:atei_bartim/core.dart';
import 'package:flutter/material.dart';

class ScanQr {
  final url = AppConfig.baseUrl;
  static Dio dio = Diointerceptors.dio;
  checkLocation(String lat, String long) async {
    try {
      var response = await Dio().post(
        "$url/api/user/verifikasi_loc",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {"id": AuthService.id, "latitude": "$lat", "longitude": "$long"},
      );
      Map<String, dynamic> obj = response.data;

      return obj['data'];
    } on Exception {
      hideLoading();
      return showInfoDialog(
        message: "Koneksi ke server gagal",
        title: "Error",
        icon: Icon(
          Icons.error,
          color: Colors.red,
          size: 24.0,
        ),
      );
    }
  }

  Future postQrIn(String qrIn) async {
    try {
      var response = await Dio().post(
        "$url/api/user/qr_in",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {
          "qr_in": qrIn,
          "id": AuthService.id,
        },
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception catch (err) {
      return;
    }
  }

  Future postQrOut(String qrOut) async {
    try {
      var response = await Dio().post(
        "$url/api/user/qr_out",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {
          "qr_out": qrOut,
          "id": AuthService.id,
        },
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception {
      return;
    }
  }
}
