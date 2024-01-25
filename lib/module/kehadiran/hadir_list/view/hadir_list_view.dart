import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../controller/hadir_list_controller.dart';

class HadirListView extends StatefulWidget {
  const HadirListView({Key? key}) : super(key: key);

  Widget build(context, HadirListController controller) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    controller.view = this;

    final List data = controller.dataList;
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

                Text(
                  "text",
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                Divider(),
                if (!controller.isShowData)
                  IntrinsicWidth(
                    child: DataTable(
                      horizontalMargin: 2,
                      headingRowHeight: 30,
                      dataTextStyle: TextStyle(fontSize: 11),
                      columns: [
                        DataColumn(
                          label: Text(
                            'Tanggal',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          numeric: false, // Kolom bukan kolom numerik
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'Check In',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'Check Out',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          )),
                        ),
                      ],
                      rows: List<DataRow>.empty(growable: true)
                        ..addAll(data.map((rowData) {
                          return DataRow(
                            cells: [
                              DataCell(Text(rowData['Name'].toString())),
                              DataCell(Text(rowData['Age'].toString())),
                              DataCell(Text(rowData['Occupation'].toString())),
                            ],
                          );
                        })),
                    ),
                  ),

                // if (controller.isShowData)
                //   ListView.builder(
                //     itemCount: controller.izinData.length,
                //     shrinkWrap: true,
                //     physics: ScrollPhysics(),
                //     itemBuilder: (BuildContext context, int index) {
                //       var item = controller.izinData[index];
                //       DateTime dateTime = DateTime.parse(item['created_at']);
                //       return Card(
                //         child: ListTile(
                //           tileColor: Colors.white,
                //           title: Text(
                //             DateFormat('EEEE, dd MMMM yyyy', 'id')
                //                 .format(dateTime),
                //           ),
                //           subtitle: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               if (item['ket_absen_in'] != null)
                //                 Text(
                //                   "Check In : ${item["ket_absen_in"]}",
                //                   style: TextStyle(fontSize: 12),
                //                 ),
                //               if (item['ket_absen_out'] != null)
                //                 Text(
                //                   "Check Out : ${item["ket_absen_out"]}",
                //                   style: TextStyle(fontSize: 12),
                //                 ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
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
