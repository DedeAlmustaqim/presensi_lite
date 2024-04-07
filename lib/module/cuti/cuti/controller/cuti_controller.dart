import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class CutiController extends State<CutiView> {
  static late CutiController instance;
  late CutiView view;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? dateCutiFrom;
  DateTime? dateCutiTo;
  String? ketCuti;
  String? noSrt = "-";
  String? jnsCuti;
  bool isConfirmedTrue = false;

  confirmData() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      isConfirmedTrue = false;
      return;
    }
    isConfirmedTrue = true;
    setState(() {});
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  sendCuti() async {
    try {
      showLoading();
      var respond = await CutiService().sendMoreDay(
        dateStart: dateCutiFrom.toString(),
        dateEnd: dateCutiTo.toString(),
        jns: jnsCuti.toString(),
        ket: ketCuti.toString(),
        noSurat: noSrt.toString(),
      );

      bool success = respond['success'];

      if (success) {
        hideLoading();
        await showInfoDialog(
          message: respond['msg'],
          title: respond['judul'],
          icon: Icon(
            Icons.check,
            color: successColor,
            size: 24.0,
          ),
        );

        Get.offAll(MainNavigationView());
      } else {
        hideLoading();
        showInfoDialog(
          message: respond['msg'],
          title: respond['judul'],
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 24.0,
          ),
        );
      }
    } on Exception {
      showInfoDialog(
        message: "Terjadi Kesalahan Server",
        title: "Gagal",
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 24.0,
        ),
      );
    }
  }
}
