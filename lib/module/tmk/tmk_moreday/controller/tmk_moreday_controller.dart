import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../view/tmk_moreday_view.dart';

class TmkMoredayController extends State<TmkMoredayView> {
  static late TmkMoredayController instance;
  late TmkMoredayView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final formKey = GlobalKey<FormBuilderState>();

  List<String> jnsTmk = [
    'Tugas Dinas',
    'Alasan tertentu',
    'Cuti',
    'Izin Belajar'
  ];
}
