import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:atei_bartim/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NewsListView extends StatefulWidget {
  NewsListView({Key? key}) : super(key: key);

  Widget build(context, NewsListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('Berita'),
        actions: [],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        controller: controller.scrollController,
        itemCount: controller.newsData.length,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.newsData[index];
          DateTime postTimeNews = DateTime.parse(item['created_at']);
          return ZoomTapAnimation(
            onTap: () {
              Get.to(NewsDetailView(item: item));
            },
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(right: 10.0, bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                        image: NetworkImage(item['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        HtmlWidget(
                          item['content'].substring(0, 120),
                          textStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              "Selengkapnya...",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              DateFormat('dd MMMM yyyy', 'id')
                                  .format(postTimeNews),
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.bookmark,
                              size: 20.0,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  State<NewsListView> createState() => NewsListController();
}
