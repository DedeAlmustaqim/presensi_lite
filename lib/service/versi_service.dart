import 'package:atei_bartim/core.dart';

class VersiService {
  static String? version;
  static init() async {
    await getVersion();
  }

  static getVersion() async {
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
      version = obj['version'];
    } on Exception {}
  }
}
