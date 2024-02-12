import 'package:atei_bartim/core.dart';

class ConnectionService {
  static bool? connection;
  static init() async {
    await connectionCheck();
  }

  static connectionCheck() async {
    try {
      await Dio().get(
        "${AppConfig.baseUrl}",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      connection = true;
    } on Exception {
      connection = false;
    }
  }
}
