import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:presensi/core.dart';

class HadirListController extends State<HadirListView> {
  static late HadirListController instance;
  late HadirListView view;
  DateTime currentDate = DateTime.now();

  bool isShowData = false;
  List dataList = [];
  @override
  void initState() {
    getRekap();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  showDateRekap() async {
    showMonthPicker(
      context: context,
    ).then(
      (date) {
        if (date != null) {
          setState(() {
            currentDate = date;
          });
          getRekap();
        }
      },
    );
  }

  getRekap() async {
    var data = await UserDataService().getRekap(date: currentDate.toString());

    setState(() {
      dataList = data;
    });

    if (data != null && data.isNotEmpty) {
      setState(() {
        isShowData = true;
      });
    } else {
      setState(() {
        isShowData = false;
      });
    }
  }
}
