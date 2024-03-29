import 'package:atei_bartim/service/dinas_service.dart';
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
      return;
    }

    setState(() {});
    print('${dateTugas}, ${ketTugas}, ${noSrt}, ${partDay}');
  }

  sendTugasData() async {
    try {
      showLoading();
      var respond = await DinasService().sendTugasDinas(
          date: dateTugas.toString(),
          ket: ketTugas.toString(),
          noSurat: noSrt.toString(),
          part: partDay!.toInt());
      bool success = respond['success'];

      if (success) {
        hideLoading();
        await showInfoDialog(message: respond['msg'], title: respond['judul']);

        Get.offAll(MainNavigationView());
      } else {
        hideLoading();
        showInfoDialog(message: respond['msg'], title: respond['judul']);
      }
    } on Exception {
      showInfoDialog(message: "Terjadi Kesalahan Server", title: "Gagal");
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
