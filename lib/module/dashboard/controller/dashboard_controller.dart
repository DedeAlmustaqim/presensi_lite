import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;
  String? timeCheckIn;
  String? timeCheckOut;
  int? idCheckIn;
  int? idCheckOut;
  String? ketCheckIn;
  String? ketCheckOut;
  List imgBanner = [];
  List infoData = [];

  String? timeCheckInD;
  String? timeCheckOutD;
  int? idCheckInD;
  int? idCheckOutD;
  String? ketCheckInD;
  String? ketCheckOutD;
  String? noSrtIn;
  String? noSrtOut;

  @override
  void initState() {
    getToday();
    getBanner();
    getInfo();
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
        idCheckIn = data['id_ket_in'];
        idCheckOut = data['id_ket_out'];
        ketCheckIn = data['keterangan_in'];
        ketCheckOut = data['keterangan_out'];
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

  refresh() async {
    showSpin();
    getToday();
    getBanner();
    getInfo();
    // getNews();
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
      try {
        Get.to(AbsenDetailSearchView());
      } on Exception {
        NotifCherryToast().toastError("Terjadi Kesalahan Data", context);
      }
    }
  }
}
