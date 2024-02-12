import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/ubah_pass_view.dart';

class UbahPassController extends State<UbahPassView> {
  static late UbahPassController instance;
  late UbahPassView view;

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
