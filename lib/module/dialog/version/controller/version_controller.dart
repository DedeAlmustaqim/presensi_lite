import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/version_view.dart';

class VersionController extends State<VersionView> {
  static late VersionController instance;
  late VersionView view;

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
