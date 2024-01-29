import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:presensi/core.dart';

class NewsDetailView extends StatefulWidget {
  final Map item;
  NewsDetailView({Key? key, required this.item}) : super(key: key);

  Widget build(context, NewsDetailController controller) {
    controller.view = this;
    DateTime postTimeNews = DateTime.parse(item['created_at']);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item['thumbnail'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 25,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"],
                    style: TextStyle(fontSize: 20.0, color: textColor1),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy', 'id').format(postTimeNews),
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  Divider(),
                  HtmlWidget(
                    item["content"],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<NewsDetailView> createState() => NewsDetailController();
}
