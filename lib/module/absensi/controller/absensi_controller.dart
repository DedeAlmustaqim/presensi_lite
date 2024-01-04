import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import '../view/absensi_view.dart';

class AbsensiController extends State<AbsensiView> {
  static late AbsensiController instance;
  late AbsensiView view;

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
