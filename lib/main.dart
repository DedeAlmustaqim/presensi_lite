import 'package:atei_bartim/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

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
  String? token;

  bool _showSplash = true;
  @override
  void initState() {
    initialization();
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

  void initialization() async {
    await InitService.init();
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _showSplash = false;
      token = DB.getToken();
    });
  }

  Widget get mainView {
    if (!ConnectionService.connection!) return MaintenanceView();
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
      home: _showSplash ? SplashScreenView() : mainView,
      // home: TppView(),
      // home: SplashScreenView(),
    );
  }
}
