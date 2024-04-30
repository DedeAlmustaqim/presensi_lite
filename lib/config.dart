import 'package:atei_bartim/service/local_data_service.dart';

class AppConfig {
  // static String baseUrl = "https://api-absen.baritotimurkab.go.id/public";
  // static String baseUrl = "http://192.168.1.42:8000";
  // static String baseUrl = "http://192.168.0.104:8000";
  // static String baseUrl = "http://10.191.254.149:8000";
  static String baseUrl = "http://192.168.1.49:8000";
  // static String baseUrl = "https://api-dev.baritotimurkab.go.id/public";
  static int? id = DB.getUserId();
  static String? version = "1.1.9";
}
