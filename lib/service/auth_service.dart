import 'package:atei_bartim/core.dart';
import 'package:atei_bartim/shared/util/dialog/show_info_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  var url = AppConfig.baseUrl;
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
        "$url/api/api_login",
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
        showInfoDialog(message: "NIK/Password Salah", title: "Gagal Login");
        // print(status);
      }
    } on Exception catch (err) {
      hideLoading();
      showInfoDialog(message: err.toString(), title: "Error");
    }
  }

  Future<void> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Membersihkan semua data cache
  }

  logout() async {
    await dio.post(
      "${url}/api/logout",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
  }
}
