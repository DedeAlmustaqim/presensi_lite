import 'package:presensi/core.dart';
import 'package:presensi/models/user_detail.dart';

class UserDataService {
  static UserDetail? userData;
  static init() async {
    await getUser();
  }

  static Future getUser() async {
    var url = AppConfig.baseUrl;
    var response = await Dio().get(
      "$url/api/user/${AppConfig.idUser}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
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

    print(obj);

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

    print(obj);

    return obj['data'];
  }
}
