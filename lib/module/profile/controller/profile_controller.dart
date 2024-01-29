import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;
  bool isDetail = false;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  showDetail() async {
    setState(() {
      isDetail = !isDetail;
    });
  }

  doLogout() async {
    showLoading(message: "Logout");
    // await AuthService().logout();
    DB.clearDatabase();

    hideLoading();
    Get.offAll(LoginView());
  }
}
