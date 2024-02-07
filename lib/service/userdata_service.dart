import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:presensi/models/user_detail.dart';

class UserDataService {
  static UserDetail? userData;
  static init() async {
    await getUser();
  }

  static getUser() async {
    try {
      var url = AppConfig.baseUrl;
      var response = await Dio().get(
        "$url/api/user/${AuthService.id}}",
        // "$url/api/user/1",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
      );
      Map obj = response.data;

      userData = UserDetail.fromJson(obj['data']);

      print(userData);
    } on Exception {
      hideLoading();
      showInfoDialog(message: "Koneksi ke server gagal", title: "Error");
    }
  }

  getIzin({required String date}) async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_ijin_bulanan",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
        "date": date,
      },
    );

    Map obj = response.data;

    return obj['data'];
  }

  getRekap({required String date}) async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_rekap_bulanan",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
        "date": date,
      },
    );

    Map obj = response.data;

    return obj['data'];
  }

  getToday() async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_today",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
      },
    );
    Map obj = response.data;

    return obj['data'];
  }

  changePass(String newPass, String confirmPass) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/user/update_pass",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
        "new_pass": newPass,
        "new_pass_repeat": confirmPass
      },
    );
    Map obj = response.data;
    return obj['success'];
  }

  getComment({int? itemId}) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/news/get_comments",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": itemId,
      },
    );
    Map obj = response.data;
    return obj['data'];
  }

  sendComment({int? itemId, String? comment}) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/news_comment",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {"id_user": AppConfig.id, "id_news": itemId, "comment": comment},
    );
    Map obj = response.data;

    if (obj['success']) {
      showInfoDialog(message: obj['message'], title: "Berhasil");
    } else {
      showInfoDialog(message: obj['message'], title: "Gagal");
    }
  }

  delNews({int? idNews}) async {
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/api/news_comment/$idNews",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;

    var success = obj['success'];

    return success;
  }
}
