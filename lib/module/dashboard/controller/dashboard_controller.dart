import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

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
    getNews();
    UserDataService.init();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

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
    print(banner);
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
    print(newsData);
  }

  refresh() async {
    showLoading();
    getToday();
    getBanner();
    getInfo();
    getNews();
    hideLoading();
  }
}
