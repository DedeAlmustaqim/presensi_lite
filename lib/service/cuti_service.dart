import 'package:atei_bartim/core.dart';

class CutiService {
  sendMoreDay({
    required String dateStart,
    required String dateEnd,
    required String noSurat,
    required String jns,
    required String ket,
  }) async {
    String dateStartConvert = convertDate(dateStart);
    String dateEndConvert = convertDate(dateEnd);

    try {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/api/cuti/cuti_add",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {
          "id": AuthService.id,
          "date_start": dateStartConvert,
          "date_end": dateEndConvert,
          "jns": jns,
          "ket": ket,
          "no_surat": noSurat,
        },
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception catch (err) {
      print(err);
    }
  }

  String convertDate(String date) {
    int spaceIndex = date.indexOf(' ');
    String formattedDate = date.substring(0, spaceIndex);
    return formattedDate;
  }
}
