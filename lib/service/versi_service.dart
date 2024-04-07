import 'package:atei_bartim/core.dart';

class VersiService {
  Future<String?> getVersion() async {
    try {
      var response = await Dio().get(
        "${AppConfig.baseUrl}/api/version",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      Map obj = response.data;
      return obj['version'];
    } on Exception {}
    return null;
  }
}
