import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/tms_fullday_view.dart';

class TmsFulldayController extends State<TmsFulldayView> {
  static late TmsFulldayController instance;
  late TmsFulldayView view;

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
