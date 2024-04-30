import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class TppController extends State<TppView> {
  static late TppController instance;
  late TppView view;

  @override
  void initState() {
    getTpp();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List dataList = [];
  DateTime currentDate = DateTime.now();

  int? id;
  int? idUser;
  double? tl1;
  double? tl2;
  double? tl3;
  double? tl4;
  double? psw1;
  double? psw2;
  double? psw3;
  double? psw4;
  double? thck1;
  double? thck2;
  double? thck3;
  double? tk;
  double? tu;
  double? lhkpn;
  double? tptgr;
  double? dk;
  double? subtraction;
  int? month;
  int? year;
  String? updatedAt;
  String? updatedBy;
  String? name;
  String? statusPeg;
  String? nip;

  showDateTpp() async {
    showMonthPicker(
      headerColor: primaryColor,
      context: context,
    ).then(
      (date) {
        if (date != null) {
          setState(() {
            currentDate = date;
          });
          getTpp();
        }
      },
    );
  }

  getTpp() async {
    var data = await UserDataService().getTpp(AuthService.id, currentDate);
    if (data.isNotEmpty) {
      dataList = data;
      for (var tpp in data) {
        id = tpp['id'] as int?;
        idUser = tpp['id_user'] as int?;
        tl1 = tpp['tl1'].toDouble();
        tl2 = tpp['tl2'].toDouble();
        tl3 = tpp['tl3'].toDouble();
        tl4 = tpp['tl4'].toDouble();
        psw1 = tpp['psw1'].toDouble();
        psw2 = tpp['psw2'].toDouble();
        psw3 = tpp['psw3'].toDouble();
        psw4 = tpp['psw4'].toDouble();
        thck1 = tpp['thck1'].toDouble();
        thck2 = tpp['thck2'].toDouble();
        thck3 = tpp['thck3'].toDouble();
        tk = tpp['tk'].toDouble();
        tu = tpp['tu'].toDouble();
        lhkpn = tpp['lhkpn'].toDouble();
        tptgr = tpp['tptgr'].toDouble();
        dk = tpp['dk'].toDouble();
        subtraction = tpp['subtraction'].toDouble();
        month = tpp['month'] as int?;
        year = tpp['year'] as int?;
        updatedAt = tpp['updated_at'];
        updatedBy = tpp['updated_by'];
        name = tpp['name'];
        statusPeg = tpp['status_peg'];
        nip = tpp['nip'];
        setState(() {});
      }
    } else {
      dataList = [];
      setState(() {});
    }
  }
}
