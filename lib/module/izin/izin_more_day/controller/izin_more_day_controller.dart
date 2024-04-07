import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class IzinMoreDayController extends State<IzinMoreDayView> {
  static late IzinMoreDayController instance;
  late IzinMoreDayView view;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? dateIzinFrom;
  DateTime? dateIzinTo;
  String? ketIzin;
  String? noSrt = "-";
  String? jnsIzin;
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

  sendIzinMoreDay() async {
    try {
      showLoading();
      var respond = await IzinService().sendMoreDay(
        dateStart: dateIzinFrom.toString(),
        dateEnd: dateIzinTo.toString(),
        jns: jnsIzin.toString(),
        ket: ketIzin.toString(),
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
