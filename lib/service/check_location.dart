import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class CheckLocation {
  checkLocation(String lat, String long) async {
    var response = await Dio().post(
      "http://192.168.0.105:8000/api/user/verifikasi_loc",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {"id": "1", "latitude": "$lat", "longitude": "$long"},
    );
    Map obj = response.data;
    return obj['data'];
  }
}
