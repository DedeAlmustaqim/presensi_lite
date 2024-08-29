
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/credits_view.dart';

class CreditsController extends State<CreditsView> {
  static late CreditsController instance;
  late CreditsView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    