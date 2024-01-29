import 'package:presensi/core.dart';
import 'package:presensi/models/user_detail.dart';

class UserDataService {
  static late Dio dio = Dio();

  static UserDetail? userData;
  static init() async {
    if (AppConfig.idUser == null) {
      DB.clearDatabase();
      Get.offAll(LoginView);
    }
    dio = await Diointerceptors.init(); // Use await here
    await getUser();
  }

  static getUser() async {
    var url = AppConfig.baseUrl;
    var response = await dio.get(
      "$url/api/user/${AppConfig.idUser}",
    );
    Map<String, dynamic> obj = response.data;
    Map<String, dynamic> userMap = obj["data"];
    userData = UserDetail.fromJson(userMap);

    print(userData);
  }

  getIzin({required String date}) async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_ijin_bulanan",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "id": AppConfig.idUser,
        "date": date,
      },
    );

    Map obj = response.data;

    return obj['data'];
  }

  getRekap({required String date}) async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_rekap_bulanan",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "id": AppConfig.idUser,
        "date": date,
      },
    );

    Map obj = response.data;

    return obj['data'];
  }

  getToday() async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_today",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "id": AppConfig.idUser,
      },
    );
    Map obj = response.data;

    return obj['data'];
  }
}
