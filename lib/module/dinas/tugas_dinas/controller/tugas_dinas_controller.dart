import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/tugas_dinas_view.dart';

class TugasDinasController extends State<TugasDinasView> {
  static late TugasDinasController instance;
  late TugasDinasView view;

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
