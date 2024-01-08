import 'package:presensi/core.dart';
import 'package:presensi/model/user_model.dart';

class AuthService {
  var url = AppConfig.baseUrl;
  static User? currentUser;
  String? token;

  login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "$url/api/api_login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      // Map obj = response.data;
      // return obj['data'];

      Map<String, dynamic> obj = response.data;
      Map<String, dynamic> userMap = obj["data"];
      currentUser = User.fromJson(userMap);
      token = currentUser!.token;
      // var token = userMap['name'];
      // var idUser = userMap['id'];
      // var name = userMap['name'];
      print(token);
      DB.setUser(currentUser!.toJson());
      DB.setToken(token!);

      // DB.setId(idUser!);
    } catch (e) {}
  }
}
