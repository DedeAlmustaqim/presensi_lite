import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  List<Map<String, dynamic>> menuItems = [
    {'name': 'Kehadiran', 'icon': MdiIcons.clock},
    {'name': 'Kalender', 'icon': Icons.calendar_month},
    {'name': 'Ijin', 'icon': MdiIcons.clockAlert},
    {'name': 'Lembur', 'icon': MdiIcons.officeBuilding},
    // Tambahkan item menu lainnya sesuai kebutuhan
  ];
}
