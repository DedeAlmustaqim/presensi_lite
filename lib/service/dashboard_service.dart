import 'package:presensi/core.dart';

class DashboardService {
  getBanner() async {
    try {
      var response = await Dio().get(
        "${AppConfig.baseUrl}/api/banner?per_page=5",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception {
      showInfoDialog(message: "Koneksi ke server gagal", title: "Error");
    }
  }

  getInfo() async {
    try {
      var response = await Dio().get(
        "${AppConfig.baseUrl}/api/info?per_page=5",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception {
      showInfoDialog(message: "Koneksi ke server gagal", title: "Error");
    }
  }

  getNews() async {
    try {} on Exception catch (err) {
      print(err);
    }
    var response = await Dio().get(
      "${AppConfig.baseUrl}/api/news?per_page=5",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }
}
