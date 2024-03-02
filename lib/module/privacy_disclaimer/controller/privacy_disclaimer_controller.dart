import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/privacy_disclaimer_view.dart';

class PrivacyDisclaimerController extends State<PrivacyDisclaimerView> {
  static late PrivacyDisclaimerController instance;
  late PrivacyDisclaimerView view;

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
