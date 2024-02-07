import 'package:intl/date_symbol_data_local.dart';
import 'package:presensi/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await VersiService.init();

  await DB.init();
  var token = DB.getToken();
  var id = DB.getUserId();
  if (token != null) {
    AuthService.id = id;
    await UserDataService.getUser();
  }
  await Diointerceptors.init();

  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  bool ready = false;
  bool isNotSafeDevice = false;
  Position? position;
  late LocationServiceResponse locationServiceResponse;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Navigator.of(context).pushReplacementNamed('/profile');
    }
  }

  var token = DB.getToken();
  Widget get mainView {
    if (AppConfig.version != VersiService.version) return VersionView();
    if (token != null) return MainNavigationView();

    return LoginView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATEI BARTIM',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: mainView,
    );
  }
}
