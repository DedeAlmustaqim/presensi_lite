import 'package:atei_bartim/core.dart';

class IzinService {
  sendIzinSehari(
      {required String date,
      required String noSurat,
      required String ket,
      required String jns,
      required int part}) async {
    int spaceIndex = date.indexOf(' ');
    String formattedDate = date.substring(0, spaceIndex);

    try {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/api/izin/izin_sehari",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {
          "id": AuthService.id,
          "date": formattedDate,
          "ket": ket,
          "jns": jns,
          "no_surat": noSurat,
          "part_day": part,
        },
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception {}
  }

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
        "${AppConfig.baseUrl}/api/izin/izin_more_day",
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
    } on Exception {}
  }

  String convertDate(String date) {
    int spaceIndex = date.indexOf(' ');
    String formattedDate = date.substring(0, spaceIndex);
    return formattedDate;
  }
}
