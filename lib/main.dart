import 'package:intl/date_symbol_data_local.dart';
import 'package:presensi/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id');
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  await DB.init();
  if (DB.getToken() != null) {
    await UserDataService.init();
  }

  await Diointerceptors.init();

  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
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
    if (token != null) return MainNavigationView();

    return LoginView();
  }

  @override
  Widget build(BuildContext context) {
    // PermissionService().checkCameraPermission();
    // PermissionService().checkLocationPermission();
    return MaterialApp(
      title: 'Presensi',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      // home: LoginView(),
      home: mainView,
      onGenerateRoute: (routeSettings) {
        print(routeSettings.name);
        return null;
      },
      // builder: (context, child) {
      //   print(Get.currentContext.toString());
      //   return DebugView(
      //     context: context,
      //     child: child,
      //     visible: true,
      //   );
      // },
    );
  }
}
