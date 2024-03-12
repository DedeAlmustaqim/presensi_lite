import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/absen_detail_search_view.dart';

class AbsenDetailSearchController extends State<AbsenDetailSearchView> {
  static late AbsenDetailSearchController instance;
  late AbsenDetailSearchView view;
  String? date;
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
