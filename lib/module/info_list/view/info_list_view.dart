import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class InfoListView extends StatefulWidget {
  const InfoListView({Key? key}) : super(key: key);

  Widget build(context, InfoListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengumuman"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if (controller.infoTotal != null)
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '${controller.infoTotal.toString()} Pengumuman',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling for ListView.builder
                shrinkWrap: true,
                itemCount: controller.infoData.length,

                itemBuilder: (BuildContext context, int index) {
                  var item = controller.infoData[index];
                  DateTime postTime = DateTime.parse(item['created_at']);
                  return ZoomTapAnimation(
                    onTap: () {
                      showInfoDialog(
                          message: item['informasi'], title: item['title']);
                    },
                    child: Container(
                      height: 200,
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
                                Text(
                                  item['informasi'],
                                  textAlign: TextAlign.justify,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.0,
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<InfoListView> createState() => InfoListController();
}
