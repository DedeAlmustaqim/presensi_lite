import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class DalamDaerahController extends State<DalamDaerahView> {
  static late DalamDaerahController instance;
  late DalamDaerahView view;

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
  String? ketDd;
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

  sendDalamDaerah() async {
    try {
      showLoading();
      var respond = await DinasService().sendDalamDaerah(
          dateStart: dateStart.toString(),
          dateEnd: dateEnd.toString(),
          noSurat: noSrt.toString(),
          ket: ketDd.toString());
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
        title: "Error",
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 24.0,
        ),
      );
    }
  }
}
