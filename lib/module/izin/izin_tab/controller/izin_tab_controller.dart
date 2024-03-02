import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/izin_tab_view.dart';

class IzinTabController extends State<IzinTabView>
    with SingleTickerProviderStateMixin {
  static late IzinTabController instance;
  late IzinTabView view;
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
