import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/cuti_view.dart';

class CutiController extends State<CutiView> {
  static late CutiController instance;
  late CutiView view;

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
