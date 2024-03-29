import 'package:atei_bartim/core.dart';

class InfoService {
  getInfo({required int page}) async {
    try {} on Exception {}
    var response = await Dio().get(
      "${AppConfig.baseUrl}/api/info/?page=$page",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }
}
