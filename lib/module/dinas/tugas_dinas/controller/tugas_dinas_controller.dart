import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class TugasDinasController extends State<TugasDinasView> {
  static late TugasDinasController instance;
  late TugasDinasView view;

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
  DateTime? dateTugas;
  String? ketTugas;
  String? noSrt = "-";
  int? partDay;
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

  sendTugasData() async {
    try {
      showSpin();
      var respond = await DinasService().sendTugasDinas(
          date: dateTugas.toString(),
          ket: ketTugas.toString(),
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

  resetForm() async {
    dateTugas = null;
    ketTugas = null;
    noSrt = null;
    partDay = null;
    formKey.currentState?.reset();
    setState(() {});
  }
}
