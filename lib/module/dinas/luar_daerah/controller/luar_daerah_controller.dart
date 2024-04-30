import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class LuarDaerahController extends State<LuarDaerahView> {
  static late LuarDaerahController instance;
  late LuarDaerahView view;

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
  DateTime? dateStart;
  DateTime? dateEnd;
  String? ketDl;
  String? noSrt;

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

  sendLuarDaerah() async {
    try {
      showSpin();
      var respond = await DinasService().sendLuarDaerah(
          dateStart: dateStart.toString(),
          dateEnd: dateEnd.toString(),
          noSurat: noSrt.toString(),
          ket: ketDl.toString());
      var title = respond['judul'];
      var msg = respond['msg'];
      bool success = respond['success'];
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
