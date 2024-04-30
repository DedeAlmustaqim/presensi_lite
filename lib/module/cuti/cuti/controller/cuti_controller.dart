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
      showSpin();
      var respond = await CutiService().sendMoreDay(
        dateStart: dateCutiFrom.toString(),
        dateEnd: dateCutiTo.toString(),
        jns: jnsCuti.toString(),
        ket: ketCuti.toString(),
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
