import 'package:presensi/service/local_data_service.dart';

class AppConfig {
  static String baseUrl = "https://api-absen.baritotimurkab.go.id/public";
  static int? id = DB.getUserId();
  static String? version = "1.0.0";
}
