import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class NewsListController extends State<NewsListView> {
  static late NewsListController instance;
  late NewsListView view;

  @override
  void initState() {
    getNews();
    scrollController.addListener(() {
      double offset = scrollController.offset;
      double maxOffset = scrollController.position.maxScrollExtent;
      if (offset == maxOffset) {
        nextPage();
      }
    });
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int page = 1;
  ScrollController scrollController = ScrollController();

  List newsData = [];

  getNews() async {
    newsData = await NewsService().getNews(page: page);
    setState(() {});
  }

  nextPage() async {
    page++;
    showLoading();
    List newNewsData = await NewsService().getNews(page: page);
    if (newNewsData.isEmpty) {
      page--;
    }
    newsData.addAll(newNewsData);
    hideLoading();
    setState(() {});
  }
}
