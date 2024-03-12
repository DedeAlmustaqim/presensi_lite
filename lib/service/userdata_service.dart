import 'package:atei_bartim/core.dart';
import 'package:atei_bartim/models/user_detail.dart';

class UserDataService {
  static UserDetail? userData;
  static init() async {
    await getUser();
  }

  static getUser() async {
    try {
      var url = AppConfig.baseUrl;
      var response = await Dio().get(
        "$url/api/user/${AuthService.id}}",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
      );
      Map obj = response.data;

      userData = UserDetail.fromJson(obj['data']);
    } on Exception {}
  }

  getIzin({required String date}) async {
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_ijin_bulanan",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
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
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
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
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
      },
    );
    Map obj = response.data;

    return obj['data'];
  }

  String convertDate(String date) {
    int spaceIndex = date.indexOf(' ');
    String formattedDate = date.substring(0, spaceIndex);
    return formattedDate;
  }

  getDay({required String date}) async {
    String dateConvert = convertDate(date);
    var url = AppConfig.baseUrl;
    var response = await Dio().post(
      "$url/api/user/get_day",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {"id": AuthService.id, "date": dateConvert},
    );
    Map obj = response.data;

    return obj['data'];
  }

  changePass(String newPass, String confirmPass) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/user/update_pass",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": AuthService.id,
        "new_pass": newPass,
        "new_pass_repeat": confirmPass
      },
    );
    Map obj = response.data;
    return obj['success'];
  }

  getComment({int? itemId, required int page}) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/news/get_comments?page=$page",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {
        "id": itemId,
      },
    );
    Map obj = response.data;
    return obj;
  }

  sendComment({int? itemId, String? comment}) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/news_comment",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {"id_user": AppConfig.id, "id_news": itemId, "comment": comment},
    );
    Map obj = response.data;

    if (obj['success']) {
      showInfoDialog(message: obj['message'], title: "Berhasil");
    } else {
      showInfoDialog(message: obj['message'], title: "Gagal");
    }
  }

  delNews({int? idNews}) async {
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/api/news_comment/$idNews",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;

    var success = obj['success'];

    return success;
  }
}
