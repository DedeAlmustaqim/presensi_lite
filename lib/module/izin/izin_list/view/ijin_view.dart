import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
import 'package:presensi/shared/widget/form/dropdown/dropdown_custome.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../controller/ijin_controller.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class IjinView extends StatefulWidget {
  IjinView({Key? key}) : super(key: key);

  Widget build(context, IjinController controller) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kelola Izin",
        ),
        actions: [],
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
                        controller.showDate();
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
                    ZoomTapAnimation(
                      onTap: () {
                        controller.getIjin();
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
                          color: successColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              MdiIcons.plus,
                              size: 12.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "Izin",
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
                if (!controller.isShowData)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    // color: Colors.blue,
                    margin: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "Tidak ada Data",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                if (controller.isShowData)
                  ListView.builder(
                    itemCount: controller.izinData.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.izinData[index];
                      DateTime dateTime = DateTime.parse(item['created_at']);
                      return Card(
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Text(
                            DateFormat('EEEE, dd MMMM yyyy', 'id')
                                .format(dateTime),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item['ket_absen_in'] != null)
                                Text(
                                  "Check In : ${item["ket_absen_in"]}",
                                  style: TextStyle(fontSize: 12),
                                ),
                              if (item['ket_absen_out'] != null)
                                Text(
                                  "Check Out : ${item["ket_absen_out"]}",
                                  style: TextStyle(fontSize: 12),
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
      ),
    );
  }

  @override
  State<IjinView> createState() => IjinController();
}
