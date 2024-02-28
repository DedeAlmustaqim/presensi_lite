import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TmkFulldayController extends State<TmkFulldayView> {
  static late TmkFulldayController instance;
  late TmkFulldayView view;

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

  List<String> jnsTmk = ['Tugas Dinas', 'Alasan tertentu'];
}
