import 'package:presensi/core.dart';
import 'package:presensi/models/user_model.dart';

class AuthService {
  var url = AppConfig.baseUrl;
  static String? idUser;
  static String? token;
  static UserModel? currentUser;

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
    // Map obj = response.data;
    // return obj['data'];

    Map<String, dynamic> obj = response.data;
    bool status = obj["success"];
    Map<String, dynamic> userMap = obj["data"];

    currentUser = UserModel.fromJson(userMap);

    if (status) {
      token = currentUser!.token;
      idUser = currentUser!.id.toString();

      print(token);
      print(idUser);

      DB.setToken(token!);
      DB.set("id", idUser!);
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
    await Dio().post(
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
