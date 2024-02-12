import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class InfoListController extends State<InfoListView> {
  static late InfoListController instance;
  late InfoListView view;

  @override
  void initState() {
    getInfo();
    scrollController.addListener(() {
      double offset = scrollController.offset;
      double maxOffset = scrollController.position.maxScrollExtent;
      if (offset == maxOffset) {
        nextPage();
      }
    });
    instance = this;
    super.initState();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List infoData = [];
  int? infoTotal;
  int page = 1;
  ScrollController scrollController = ScrollController();

  nextPage() async {
    page++;
    showLoading();
    var infoDataMap = await InfoService().getInfo(page: page);

    var newInfoData = infoDataMap['data'];
    if (newInfoData.isEmpty) {
      page--;
    }
    infoData.addAll(newInfoData);
    hideLoading();
    setState(() {});
  }

  getInfo() async {
    var infoDataMap = await InfoService().getInfo(page: page);

    infoData = infoDataMap['data'];
    infoTotal = infoDataMap['total'];

    setState(() {});
  }
}
