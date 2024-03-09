import 'package:atei_bartim/service/dinas_service.dart';
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

  confirmData() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    setState(() {});
    // print('${dateStart}, ${dateEnd}, ${ketDd}, ${noSrt}');
  }

  sendLuarDaerah() async {
    try {
      showLoading();
      var respond = await DinasService().sendLuarDaerah(
          dateStart: dateStart.toString(),
          dateEnd: dateEnd.toString(),
          noSurat: noSrt.toString(),
          ket: ketDl.toString());
      bool success = respond['success'];
      print(success);
      if (success) {
        hideLoading();
        await showInfoDialog(message: respond['msg'], title: respond['judul']);

        Get.offAll(MainNavigationView());
      } else {
        hideLoading();
        showInfoDialog(message: respond['msg'], title: respond['judul']);
      }
    } on Exception catch (err) {
      print(err);
    }
  }
}
