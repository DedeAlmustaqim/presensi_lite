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
      showSpin();
      var respond = await IzinService().sendMoreDay(
        dateStart: dateIzinFrom.toString(),
        dateEnd: dateIzinTo.toString(),
        jns: jnsIzin.toString(),
        ket: ketIzin.toString(),
        noSurat: noSrt.toString(),
      );

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
