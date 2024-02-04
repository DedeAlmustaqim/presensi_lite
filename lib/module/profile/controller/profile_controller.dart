import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;
  bool isDetail = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? newPass;
  String? confirmPass;
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

  update_pass() async {
    if (formKey.currentState?.validate() ?? false) {
      showLoading();
      try {
        hideLoading();
        var success =
            await UserDataService().change_pass(newPass!, confirmPass!);
        print(success);
        if (success) {
          showInfoDialog(message: "Berhasil ubah Password", title: '');
        } else {
          showInfoDialog(message: "Gagal ubah Password", title: '');
        }
      } on Exception catch (err) {
        hideLoading();
        print(err);
      }
    }
  }

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
                await AuthService().clearCache();
                Get.offAll(LoginView());
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
