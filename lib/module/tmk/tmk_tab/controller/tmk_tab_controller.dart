import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/tmk_tab_view.dart';

class TmkTabController extends State<TmkTabView>
    with SingleTickerProviderStateMixin {
  static late TmkTabController instance;
  late TmkTabView view;

  late TabController tabController;
  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
