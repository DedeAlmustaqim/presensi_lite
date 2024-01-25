import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:presensi/core.dart';
import '../view/ijin_view.dart';

class IjinController extends State<IjinView> {
  static late IjinController instance;
  late IjinView view;
  DateTime currentDate = DateTime.now();
  List izinData = [];
  bool isShowData = false;
  bool isLoading = false;

  List<Map<String, dynamic>> dataList = [];
  // Format bulan dan tahun seperti "Januari 2023"
  @override
  void initState() {
    getIjin();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  showDate() async {
    showMonthPicker(
      context: context,
      // initialDate: DateTime.now(),
    ).then(
      (date) {
        if (date != null) {
          setState(() {
            currentDate = date;
          });
          getIjin();
          print(currentDate);
        }
      },
    );
  }

  getIjin() async {
    var data = await UserDataService().getIzin(date: currentDate.toString());

    setState(() {
      izinData = data;
    });

    if (data != null && data.isNotEmpty) {
      setState(() {
        isShowData = true;
        print(isShowData);
      });
    } else {
      setState(() {
        isShowData = false;
        print(isShowData);
      });
    }
  }
}
