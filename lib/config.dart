import 'package:presensi/core.dart';
import 'package:presensi/service/local_data_service.dart';

class AppConfig {
  static String baseUrl = "http://192.168.1.23:8000";
  static String? token = DB.getToken();
  static String? idUser = DB.get("id");
}
