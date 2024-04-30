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
      isConfirmedTrue = false;
      return;
    }
    isConfirmedTrue = true;
    setState(() {});
  }

  sendIzinSehari() async {
    try {
      showSpin();
      var respond = await IzinService().sendIzinSehari(
          date: dateIzin.toString(),
          jns: jnsIzin.toString(),
          ket: ketIzin.toString(),
          noSurat: noSrt.toString(),
          part: partDay!.toInt());
      bool success = respond['success'];

      var title = respond['judul'];
      var msg = respond['msg'];
      if (success) {
        hideLoading();

        await NotifCherryToast().toastSuccess("$title " "$msg", context);

        Get.offAll(MainNavigationView());
      } else {
        hideLoading();
        await NotifCherryToast().toastError("$title " "$msg", context);
      }
    } on Exception {
      NotifCherryToast().toastError("Terjadi Kesalahan Server", context);
    }
  }
}
