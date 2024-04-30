import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class AbsenDetailSearchView extends StatefulWidget {
  // final String? dateDetailParam;
  // final String? timeCheckInParam;
  // final String? timeCheckOutParam;
  // final int? idCheckInParam;
  // final int? idCheckOutParam;
  // final String? ketCheckInParam;
  // final String? ketCheckOutParam;
  // final String? noSrtInParam;
  // final String? noSrtOutParam;
  AbsenDetailSearchView({
    Key? key,
  }) : super(key: key);

  Widget build(context, AbsenDetailSearchController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('EEEE, dd MMMM yyyy', 'id')
              .format(controller.date ?? DateTime.now()),
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(10.0),
              borderOnForeground: true,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            color: successColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        controller.idCheckInParam != 1
                            ? Text(
                                controller.ketCheckInParam ?? 'Belum Check In',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                controller.timeCheckInParam != null
                                    ? "Hadir"
                                    : "Belum Check In",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ],
                    ),
                    Divider(),
                    controller.idCheckInParam == 1
                        //sudah absen
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Anda telah melakukan Check In pada jam ${controller.timeCheckInParam}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )

                        // keterangan
                        : controller.idCheckInParam != null
                            ? Column(
                                children: [
                                  buildRow(
                                      label: "Nomor Surat",
                                      value: controller.noSrtInParam),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  buildRow(
                                      label: "Keterangan",
                                      value: controller.ketCheckInParam)
                                ],
                              )
                            // belum absen
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Belum Absen',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "Anda masih bisa mengajukan Dinas/Izin/Cuti pada Tanggal Check In ini",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              borderOnForeground: true,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            color: orangeColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        controller.idCheckOutParam != 1
                            ? Text(
                                controller.ketCheckOutParam ??
                                    'Belum Check Out',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                controller.timeCheckOutParam != null
                                    ? "Hadir"
                                    : "Belum Check Out",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ],
                    ),
                    Divider(),
                    controller.idCheckOutParam == 1
                        //sudah absen
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Anda telah melakukan Check Out pada jam ${controller.timeCheckOutParam}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )

                        // keterangan
                        : controller.ketCheckOutParam != null
                            ? Column(
                                children: [
                                  buildRow(
                                      label: "Nomor Surat",
                                      value: controller.noSrtOutParam),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  buildRow(
                                      label: "Keterangan",
                                      value: controller.ketCheckOutParam)
                                ],
                              )
                            // belum absen
                            : Text(
                                "Anda masih bisa mengajukan Dinas/Izin/Cuti pada Tanggal Check Out ini",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      "Catatan",
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          "Anda hanya bisa mengajukan Dinas Dalam Daerah, Dinas Luar Daerah, Izin Lebih dari Satu Hari, dan Cuti jika anda belum Check In/Out pada tanggal ini",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          "Sedangkan untuk Tugas Dinas dan Izin Satu Hari anda dapat memilih pada jam Check In/Out/Full Time",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<AbsenDetailSearchView> createState() => AbsenDetailSearchController();
}
