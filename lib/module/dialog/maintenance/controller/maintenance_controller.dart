import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/maintenance_view.dart';

class MaintenanceController extends State<MaintenanceView> {
  static late MaintenanceController instance;
  late MaintenanceView view;

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
