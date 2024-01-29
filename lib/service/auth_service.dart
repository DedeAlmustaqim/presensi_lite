import 'package:presensi/core.dart';

class AuthService {
  var url = AppConfig.baseUrl;

  static Dio dio = Dio();

  login({
    required String email,
    required String password,
  }) async {
    var response = await Dio().post(
      "$url/api/api_login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );

    Map<String, dynamic> obj = response.data;
    bool status = obj["success"];
    Map<String, dynamic> userMap = obj["data"];

    if (status) {
      await DB.setToken(userMap['token']!);
      await DB.set("id", userMap['id'].toString());

      await UserDataService.init();
      hideLoading();
      Get.offAll(MainNavigationView());
    } else {
      hideLoading();
      showInfoDialog(message: "Email/Password Salah", title: "Gagal Login");
      // print(status);
    }
  }

  logout() async {
    await dio.post(
      "${url}/api/logout",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
    );
  }
}
