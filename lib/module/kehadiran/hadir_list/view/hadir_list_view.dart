import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HadirListView extends StatefulWidget {
  const HadirListView({Key? key}) : super(key: key);

  Widget build(context, HadirListController controller) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kehadiran"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('MMMM yyyy', 'id').format(controller
                          .currentDate), // Format bulan dan tahun seperti "Januari 2023",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    ZoomTapAnimation(
                      onTap: () {
                        controller.showDateRekap();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              MdiIcons.calendar,
                              size: 12.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "Pilih Bulan",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                if (controller.isShowData)
                  ListView.builder(
                    itemCount: controller.dataList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.dataList[index];
                      DateTime? dateTimeIn = item['tgl_in'] != null
                          ? DateTime.parse(item['tgl_in'])
                          : null;
                      DateTime? dateTimeOut = item['tgl_out'] != null
                          ? DateTime.parse(item['tgl_out'])
                          : null;

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 5,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            dateTimeIn != null
                                ? Text(
                                    DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        .format(dateTimeIn),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                : dateTimeOut != null
                                    ? Text(
                                        DateFormat('EEEE, dd MMMM yyyy', 'id')
                                            .format(dateTimeOut),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      )
                                    : SizedBox(),
                            Divider(),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Check In",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: successColor),
                                      ),
                                      Text(
                                        item['jam_in'] != null
                                            ? item['jam_in'].toString()
                                            : "Belum Check In",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Check Out",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: warningColor),
                                      ),
                                      Text(
                                        item['jam_out'] != null
                                            ? item['jam_out'].toString()
                                            : "Belum Check Out",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<HadirListView> createState() => HadirListController();
}
