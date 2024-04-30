import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class AbsenDetailSearchController extends State<AbsenDetailSearchView> {
  static late AbsenDetailSearchController instance;
  late AbsenDetailSearchView view;
  DateTime? date = DashboardController.instance.selectedDate;
  String convertDate(String date) {
    int spaceIndex = date.indexOf(' ');
    String formattedDate = date.substring(0, spaceIndex);
    return formattedDate;
  }

  String? dateString;
  @override
  void initState() {
    getData();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? timeCheckInParam;
  String? timeCheckOutParam;
  int? idCheckInParam;
  int? idCheckOutParam;
  String? ketCheckInParam;
  String? ketCheckOutParam;
  String? noSrtInParam;
  String? noSrtOutParam;
  String? ketIn;
  String? ketOut;

  // setDate({String? dateParam}) async {
  //   date = dateParam;
  //   setState(() {});
  // }

  getData() async {
    var dateConvrt = date.toString();

    var userToday = await UserDataService().getDay(date: dateConvrt);
    for (var data in userToday!) {
      setState(() {
        dateString = dateConvrt;
        timeCheckInParam = data['jam_in'] ?? null;
        timeCheckOutParam = data['jam_out'] ?? null;
        idCheckInParam = data['id_ket_in'] ?? null;
        idCheckOutParam = data['id_ket_out'] ?? null;
        ketCheckInParam = data['keterangan_in'] ?? null;
        ketCheckOutParam = data['keterangan_out'] ?? null;
        noSrtInParam = data['no_surat_in'] ?? null;
        noSrtOutParam = data['no_surat_out'] ?? null;
        ketIn = data['ket_in'] ?? null;
        ketOut = data['ket_out'] ?? null;
      });
    }
  }
}
