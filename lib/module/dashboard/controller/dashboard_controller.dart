import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi/core.dart';
import 'package:presensi/module/izin/izin_list/view/ijin_view.dart';

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
    {
      'name': 'Kehadiran',
      'icon': MdiIcons.clock,
      'page': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HadirListView(),
          ),
        );
      },
    },
    {
      'name': 'Kalender',
      'icon': Icons.calendar_month,
      'page': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IjinView(),
          ),
        );
      },
    },
    {
      'name': 'Ijin',
      'icon': MdiIcons.clockAlert,
      'page': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IjinView(),
          ),
        );
      },
    },
    {
      'name': 'Lembur',
      'icon': MdiIcons.officeBuilding,
      'page': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileView(),
          ),
        );
      },
    },
    // Tambahkan item menu lainnya sesuai kebutuhan
  ];

  onItemTap(BuildContext context, Map<String, dynamic> menuItem) {
    // Panggil fungsi Navigator.push berdasarkan item menu
    menuItem['page'](context);
  }
}
