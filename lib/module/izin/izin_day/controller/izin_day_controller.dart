import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class IzinDayController extends State<IzinDayView> {
  static late IzinDayController instance;
  late IzinDayView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? dateIzin;
  String? ketIzin;
  String? noSrt = "-";
  int? partDay;
  String? jnsIzin;
  bool isConfirmedTrue = false;

  String partDayToString(int partDay) {
    if (partDay == 1) {
      return "Check In";
    } else if (partDay == 2) {
      return "Check Out";
    } else if (partDay == 3) {
      return "Full Time";
    } else {
      return "Unknown"; // Teks default jika nilai tidak dikenali
    }
  }

  confirmData() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    setState(() {});
  }

  sendIzinSehari() async {
    try {
      showLoading();
      var respond = await IzinService().sendIzinSehari(
          date: dateIzin.toString(),
          jns: jnsIzin.toString(),
          ket: ketIzin.toString(),
          noSurat: noSrt.toString(),
          part: partDay!.toInt());
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
