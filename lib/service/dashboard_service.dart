import 'package:presensi/core.dart';

class DashboardService {
  getBanner() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/api/banner?per_page=5",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  getInfo() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/api/info?per_page=5",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  getNews() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/api/news?per_page=5",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }
}
