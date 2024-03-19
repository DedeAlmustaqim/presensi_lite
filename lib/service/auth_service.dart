import 'package:atei_bartim/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // static UserModel? currentUser;
  static Dio dio = Dio();

  static String? token = DB.getToken();

  static int? id;

  login({
    required String nik,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "${AppConfig.baseUrl}/api/api_login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "nik": nik,
          "password": password,
        },
      );

      Map obj = response.data;
      bool status = obj["success"];
      Map userMap = obj['data'];

      id = userMap['id'];
      if (status) {
        DB.setToken(userMap['token']);
        DB.setId(userMap['id']);
        // currentUser = UserModel.fromJson(obj["data"]);
        await DB.init();
        await UserDataService.getUser();
        hideLoading();
        await Get.offAll(MainNavigationView());
      }
      if (!status) {
        hideLoading();
        showInfoDialog(
          message: userMap['message'],
          title: "Gagal Login",
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 24.0,
          ),
        );
      }
    } on Exception {
      hideLoading();
      showInfoDialog(
        message: "Terjadi Kesalahan",
        title: "Error",
        icon: const Icon(
          Icons.error,
          size: 24.0,
        ),
      );
    }
  }

  Future<void> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Membersihkan semua data cache
  }

  logout() async {
    try {
      await dio.post(
        "${AppConfig.baseUrl}/api/logout",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
      );
      return true;
    } on Exception {
      return false;
    }
  }
}
