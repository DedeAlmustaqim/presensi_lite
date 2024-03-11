import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;
  String? timeCheckIn;
  String? timeCheckOut;
  List imgBanner = [];
  List infoData = [];
  List newsData = [];

  @override
  void initState() {
    getToday();
    getBanner();
    getInfo();
    // getNews();
    UserDataService.init();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List menuData = [
    {
      "label": "Kehadiran",
      "icon": Icons.access_alarm, // Ganti dengan IconData yang sesuai
      "page": () => Get.to(HadirListView()),
    },
    {
      "label": "Dinas",
      "icon": Icons.airplanemode_active,
      // "icon": Icons.work, // Ganti dengan IconData yang sesuai
      "page": () => Get.to(DinasTabView()),
    },
    {
      "label": "Izin",
      "icon": Icons.event_note, // Ganti dengan IconData yang sesuai
      "page": () => Get.to(IzinTabView()),
    },
    {
      "label": "Cuti",
      "icon": MdiIcons.bedOutline, // Ganti dengan IconData yang sesuai
      "page": () => Get.to(CutiView()),
    },
  ];

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  DateTime? selectedDate;
  getToday() async {
    var userToday = await UserDataService().getToday();

    for (var data in userToday!) {
      setState(() {
        timeCheckIn = data['jam_in'];
        timeCheckOut = data['jam_out'];
      });
    }
  }

  getBanner() async {
    var banner = await DashboardService().getBanner();
    for (var data in banner!) {
      setState(() {
        imgBanner.add(data['img_path']);
      });
    }
  }

  getInfo() async {
    var info = await DashboardService().getInfo();
    setState(() {
      infoData = info;
    });
  }

  getNews() async {
    var news = await DashboardService().getNews();
    setState(() {
      newsData = news;
    });
  }

  refresh() async {
    showLoading();
    getToday();
    getBanner();
    getInfo();
    getNews();
    hideLoading();
  }

  Future<void> showSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      currentDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      cancelText: "Batal",
      confirmText: "Cari",
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    if (picked != null) {
      // Tambahkan logika atau fungsi yang sesuai dengan kebutuhan aplikasi Anda di sini
      print("Cari sesuatu dengan tanggal: $picked");
    }
  }
}
