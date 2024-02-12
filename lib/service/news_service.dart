import 'package:atei_bartim/core.dart';

class NewsService {
  getNews({required int page}) async {
    try {
      var response = await Dio().get(
        "${AppConfig.baseUrl}/api/news?page=$page",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception {}
  }
}
