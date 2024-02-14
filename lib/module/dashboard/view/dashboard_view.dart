import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:atei_bartim/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                image: DecorationImage(
                  image: AssetImage("assets/icon/header.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hai..!!!",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        UserDataService.userData!.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(
                        UserDataService.userData!.img.toString()),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Builder(builder: (context) {
                return Column(
                  children: [
                    CarouselSlider(
                      carouselController: controller.carouselController,
                      options: CarouselOptions(
                        height: 160.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          controller.currentIndex = index;
                          // ignore: invalid_use_of_protected_member
                          controller.setState(() {
                            controller.currentIndex;
                          });
                        },
                      ),
                      items: controller.imgBanner.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 6,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          controller.imgBanner.asMap().entries.map((entry) {
                        bool isSelected = controller.currentIndex == entry.key;
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(entry.key),
                          child: Container(
                            width: isSelected ? 40 : 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.only(
                              right: 6.0,
                              top: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? primaryColor
                                  : primaryColor.withOpacity(0.6),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              }),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // UserDataService.userData!.nmUnit.toString(),
                          DateFormat('EEEE, dd MMMM yyyy', 'id')
                              .format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: textColor1,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: textColor2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Check In",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: successColor,
                              ),
                            ),
                            Text(
                              controller.timeCheckIn != null
                                  ? controller.timeCheckIn.toString()
                                  : "Belum Check In",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40, // Tinggi garis vertikal
                          width: 1, // Lebar garis vertikal
                          color: textColor2, // Warna garis vertikal
                        ),
                        Column(
                          children: [
                            Text(
                              "Check Out",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: orangeColor),
                            ),
                            Text(
                              controller.timeCheckOut != null
                                  ? controller.timeCheckOut.toString()
                                  : "Belum Check Out",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //Menu
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    "Pengumuman",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(InfoListView());
                    },
                    child: Text(
                      "Lihat Semua",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 150.0,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 12.0,
                ),
                itemCount: controller.infoData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = controller.infoData[index];
                  DateTime postTime = DateTime.parse(item['created_at']);
                  return ZoomTapAnimation(
                    onTap: () {
                      showInfoDialog(
                          message: item['informasi'], title: item['title']);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.all(20.0),
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
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Flexible(
                                  child: Text(
                                    item['informasi'],
                                    textAlign: TextAlign.justify,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat('dd MMMM yyyy', 'id')
                                          .format(postTime),
                                      style: TextStyle(
                                        fontSize: 8.0,
                                      ),
                                    ),
                                    Spacer(),
                                    if (item['tag'] != null)
                                      Container(
                                        height: 20,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4.0),
                                          ),
                                          color: orangeColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            item['tag'],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
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
            ),

            // Berita
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    "Berita",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(NewsListView());
                    },
                    child: Text(
                      "Lihat Semua",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 165.0,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 12.0,
                ),
                itemCount: controller.newsData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = controller.newsData[index];
                  DateTime postTimeNews = DateTime.parse(item['created_at']);
                  return ZoomTapAnimation(
                    onTap: () {
                      Get.to(NewsDetailView(item: item));
                    },
                    child: Container(
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
