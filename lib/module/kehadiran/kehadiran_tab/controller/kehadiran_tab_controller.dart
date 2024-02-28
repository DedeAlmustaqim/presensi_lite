import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/kehadiran_tab_view.dart';

class KehadiranTabController extends State<KehadiranTabView>
    with SingleTickerProviderStateMixin {
  static late KehadiranTabController instance;
  late KehadiranTabView view;
  late TabController tabController;
  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
