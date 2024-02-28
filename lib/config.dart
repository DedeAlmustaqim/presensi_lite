import 'package:atei_bartim/service/local_data_service.dart';

class AppConfig {
  // static String baseUrl = "https://api-absen.baritotimurkab.go.id/public";
  static String baseUrl = "http://192.168.0.103:8000";
  static int? id = DB.getUserId();
  static String? version = "1.0.0";
}
