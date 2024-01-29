import 'package:presensi/core.dart';
import 'package:presensi/service/local_data_service.dart';

class AppConfig {
  static String baseUrl = "http://api-absen.baritotimurkab.go.id/public";
  static String? token = DB.getToken();
  static String? idUser = DB.get("id");
}
