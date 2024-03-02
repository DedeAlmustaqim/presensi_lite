import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class AbsenDetailView extends StatefulWidget {
  final Map item;
  AbsenDetailView({Key? key, required this.item}) : super(key: key);

  Widget build(context, AbsenDetailController controller) {
    DateTime? dateTimeIn =
        item['tgl_in'] != null ? DateTime.parse(item['tgl_in']) : null;
    DateTime? dateTimeOut =
        item['tgl_out'] != null ? DateTime.parse(item['tgl_out']) : null;
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: dateTimeIn != null
            ? Text(
                DateFormat('EEEE, dd MMMM yyyy', 'id').format(dateTimeIn),
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            : dateTimeOut != null
                ? Text(
                    DateFormat('EEEE, dd MMMM yyyy', 'id').format(dateTimeOut),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                : SizedBox(),
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
                        item['id_ket_in'] != 1
                            ? Text(
                                item['keterangan_in'] ?? 'Belum Check In',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                item['jam_in'] != null
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
                    item['id_ket_in'] == 1
                        //sudah absen
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Anda telah melakukan Check In pada jam ${item['jam_in']}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )

                        // keterangan
                        : item['id_ket_in'] != null
                            ? Column(
                                children: [
                                  buildRow(
                                      label: "Nomor Surat",
                                      value: item['no_surat_in']),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  buildRow(
                                      label: "Keterangan",
                                      value: item['ket_in'])
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
                        item['id_ket_out'] != 1
                            ? Text(
                                item['keterangan_out'] ?? 'Belum Check Out',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                item['jam_out'] != null
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
                    item['id_ket_out'] == 1
                        //sudah absen
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Anda telah melakukan Check Out pada jam ${item['jam_out']}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )

                        // keterangan
                        : item['id_ket_out'] != null
                            ? Column(
                                children: [
                                  buildRow(
                                      label: "Nomor Surat",
                                      value: item['no_surat_out']),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  buildRow(
                                      label: "Keterangan",
                                      value: item['ket_out'])
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
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    size: 24.0,
                  ),
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
          ],
        ),
      ),
    );
  }

  @override
  State<AbsenDetailView> createState() => AbsenDetailController();
}

Widget buildRow({String? label, String? value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Text(
          label.toString(),
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
      Text(
        ":   ",
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          value.toString(),
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
    ],
  );
}
