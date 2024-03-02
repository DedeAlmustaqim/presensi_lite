import 'package:atei_bartim/service/auth_service.dart';
import 'package:atei_bartim/service/connection_service.dart';
import 'package:atei_bartim/service/local_data_service.dart';
import 'package:atei_bartim/service/userdata_service.dart';
import 'package:atei_bartim/service/versi_service.dart';
import 'package:atei_bartim/shared/util/dio_interceptors/dio_interceptors.dart';
import 'package:intl/date_symbol_data_local.dart';

class InitService {
  static init() async {
    await initializeDateFormatting('id');

    await ConnectionService.init();
    await VersiService.init();

    await DB.init();
    var token = DB.getToken();
    var id = DB.getUserId();
    var privacy = DB.getPrivacy();
    if (token != null) {
      AuthService.id = id;
      await UserDataService.getUser();
    }
    await Diointerceptors.init();
  }
}
