import 'package:presensi/core.dart';

class VersiService {
  static init() async {
    getVersion();
  }

  static String? version;
  static getVersion() async {
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
    print(obj['version']);
  }
}
