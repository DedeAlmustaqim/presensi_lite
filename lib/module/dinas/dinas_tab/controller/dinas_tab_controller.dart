import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/dinas_tab_view.dart';

class DinasTabController extends State<DinasTabView>
    with SingleTickerProviderStateMixin {
  static late DinasTabController instance;
  late DinasTabView view;
  late TabController tabController;

  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
