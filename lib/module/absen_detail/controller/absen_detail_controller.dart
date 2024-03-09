import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/absen_detail_view.dart';

class AbsenDetailController extends State<AbsenDetailView> {
  static late AbsenDetailController instance;
  late AbsenDetailView view;

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
