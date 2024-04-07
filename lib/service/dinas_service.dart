import 'package:atei_bartim/core.dart';

class DinasService {
  sendTugasDinas(
      {required String date,
      required String noSurat,
      required String ket,
      required int part}) async {
    int spaceIndex = date.indexOf(' ');
    String formattedDate = date.substring(0, spaceIndex);

    try {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/api/dinas/tugas_dinas",
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
          "no_surat": noSurat,
          "part_day": part,
        },
      );
      Map obj = response.data;
      return obj['data'];
    } on Exception {
    }
  }

  sendDalamDaerah({
    required String dateStart,
    required String dateEnd,
    required String noSurat,
    required String ket,
  }) async {
    String dateStartConvert = convertDate(dateStart);
    String dateEndConvert = convertDate(dateEnd);

    try {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/api/dinas/dalam_daerah",
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

  sendLuarDaerah({
    required String dateStart,
    required String dateEnd,
    required String noSurat,
    required String ket,
  }) async {
    String dateStartConvert = convertDate(dateStart);
    String dateEndConvert = convertDate(dateEnd);

    try {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/api/dinas/luar_daerah",
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
