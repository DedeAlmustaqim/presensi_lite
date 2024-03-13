import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/logout_confirm_view.dart';

class LogoutConfirmController extends State<LogoutConfirmView> {
  static late LogoutConfirmController instance;
  late LogoutConfirmView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  doLogout() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Konfirmasi',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apakah Anda yakin untuk Log Out?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Warna latar belakang tombol "No"
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.black), // Warna teks tombol "No"
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red, // Warna latar belakang tombol "Yes"
              ),
              onPressed: () async {
                hideLoading();
                var logout = await AuthService().logout();
                if (logout) {
                  await DB.clearDatabase();
                  await Get.offAll(LoginView());
                } else {
                  showInfoDialog(message: "Terjadi Kesalahan", title: "Gagal");
                }
              },
              child: const Text(
                "Yes",
                style:
                    TextStyle(color: Colors.white), // Warna teks tombol "Yes"
              ),
            ),
          ],
        );
      },
    );
  }
}
