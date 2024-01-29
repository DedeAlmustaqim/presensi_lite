import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import '../view/news_detail_view.dart';

class NewsDetailController extends State<NewsDetailView> {
  static late NewsDetailController instance;
  late NewsDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
