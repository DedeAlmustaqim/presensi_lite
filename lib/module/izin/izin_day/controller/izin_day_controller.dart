import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/izin_day_view.dart';

class IzinDayController extends State<IzinDayView> {
  static late IzinDayController instance;
  late IzinDayView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
