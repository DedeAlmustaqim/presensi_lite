import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/dalam_daerah_view.dart';

class DalamDaerahController extends State<DalamDaerahView> {
  static late DalamDaerahController instance;
  late DalamDaerahView view;

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
