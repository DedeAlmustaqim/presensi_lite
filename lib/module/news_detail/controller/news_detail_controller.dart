import 'package:flutter/material.dart';
import 'package:presensi/core.dart';

class NewsDetailController extends State<NewsDetailView> {
  static late NewsDetailController instance;
  late NewsDetailView view;
  List newsComments = [];
  String? comment = '';
  final int itemId;
  NewsDetailController(this.itemId);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getNewsComments();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  getNewsComments() async {
    if (mounted) {
      var listComment = await UserDataService().getComment(itemId: itemId);
      setState(() {
        newsComments = listComment;
      });
    }
  }

  hapusComment() async {
    setState(() {
      comment = "";
    });
    print(comment);
  }

  sendComments() async {
    if (comment != "") {
      try {
        await UserDataService().sendComment(itemId: itemId, comment: comment);
        // hideLoading();
        hapusComment();
        getNewsComments();
      } on Exception catch (err) {
        // hideLoading();
        showInfoDialog(message: err.toString(), title: "");
      }
    } else {
      showInfoDialog(message: "Kolom komentar tidak boleh kosong", title: "");
    }
    // showLoading();
  }

  delNews({int? idNews}) async {
    try {
      var successDel = await UserDataService().delNews(idNews: idNews);

      print(idNews);
      if (successDel) {
        getNewsComments();
        Navigator.of(context);
      } else {
        print(successDel);
      }
    } on Exception catch (err) {
      print(err);
    }
  }
}
