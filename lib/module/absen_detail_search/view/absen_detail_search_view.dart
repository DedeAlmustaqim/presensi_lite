import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/absen_detail_search_controller.dart';

class AbsenDetailSearchView extends StatefulWidget {
  final String? dateDetail;
  final String? timeCheckIn;
  final String? timeCheckOut;
  final int? idCheckIn;
  final int? idCheckOut;
  final String? ketCheckIn;
  final String? ketCheckOut;
  final String? noSrtIn;
  final String? noSrtOut;
  AbsenDetailSearchView(
      {Key? key,
      this.dateDetail,
      this.timeCheckIn,
      this.timeCheckOut,
      this.idCheckIn,
      this.idCheckOut,
      this.ketCheckIn,
      this.ketCheckOut,
      this.noSrtIn,
      this.noSrtOut})
      : super(key: key);

  Widget build(context, AbsenDetailSearchController controller) {
    String convertDate(String date) {
      int spaceIndex = date.indexOf(' ');
      String formattedDate = date.substring(0, spaceIndex);
      return formattedDate;
    }

    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(convertDate(dateDetail!).toString()),
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
                        idCheckIn != 1
                            ? Text(
                                ketCheckIn ?? 'Belum Check In',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                timeCheckIn != null
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
                    idCheckIn == 1
                        //sudah absen
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Anda telah melakukan Check In pada jam ${timeCheckIn}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )

                        // keterangan
                        : idCheckIn != null
                            ? Column(
                                children: [
                                  buildRow(
                                      label: "Nomor Surat", value: noSrtIn),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  buildRow(
                                      label: "Keterangan", value: ketCheckIn)
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
                        idCheckOut != 1
                            ? Text(
                                ketCheckOut ?? 'Belum Check Out',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                timeCheckOut != null
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
                    idCheckOut == 1
                        //sudah absen
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Anda telah melakukan Check Out pada jam ${timeCheckOut}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )

                        // keterangan
                        : ketCheckOut != null
                            ? Column(
                                children: [
                                  buildRow(
                                      label: "Nomor Surat", value: noSrtOut),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  buildRow(
                                      label: "Keterangan", value: ketCheckOut)
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
