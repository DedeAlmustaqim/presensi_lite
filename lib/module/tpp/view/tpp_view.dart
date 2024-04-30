import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TppView extends StatefulWidget {
  TppView({Key? key}) : super(key: key);

  Widget build(context, TppController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Skor Disiplin Kerja"),
            Spacer(),
            ZoomTapAnimation(
              onTap: () {
                controller.getTpp();
              },
              child: const Icon(
                Icons.refresh,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      controller.showDateTpp();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              fontSize: 8,
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
              const SizedBox(
                height: 5.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "${UserDataService.userData!.img}",
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "${controller.name}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 10.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "NIP. ${controller.nip}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 10.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Ub. ${DateFormat('MMMM yyyy', 'id').format(controller.currentDate)}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              controller.dataList.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                rowData(
                                    "TL 1 (0.5%)",
                                    "Terlambat 1 Menit s/d < 30 Menit",
                                    controller.tl1.toString()),
                                rowData(
                                    "TL  (1%)",
                                    "Terlambat 31 Menit s/d < 60 Menit",
                                    controller.tl2.toString()),
                                rowData(
                                    "TL 3 (1.25%)",
                                    "Terlambat 61 Menit s/d < 90 Menit",
                                    controller.tl3.toString()),
                                rowData(
                                    "TL 4 (1.5%)",
                                    "Terlambat 91 Menit dan atau tidak mengisi daftar hadir masuk kerja",
                                    controller.tl4.toString()),
                                rowData(
                                    "PSW 1 (0.5%)",
                                    "Pulang Sebelum Waktu 1 Menit s/d < 30 Menit",
                                    controller.psw1.toString()),
                                rowData(
                                    "PSW 2 (1%)",
                                    "Pulang Sebelum Waktu 31 Menit s/d < 60 Menit",
                                    controller.psw2.toString()),
                                rowData(
                                    "PSW 3 (1.25%)",
                                    "Pulang Sebelum Waktu 61 Menit s/d < 90 Menit",
                                    controller.psw3.toString()),
                                rowData(
                                    "PSW 4 (1.55%)",
                                    "Pulang Sebelum Waktu 91 Menit dan atau tidak mengisi daftar hadir masuk kerja",
                                    controller.psw4.toString()),
                                rowData("THKC 1 (1%)", "Cuti Besar",
                                    controller.thck1.toString()),
                                rowData("THKC 2 (2%)", "Cuti Sakit",
                                    controller.thck2.toString()),
                                rowData("THKC 3 (3%)", "Cuti Tahunan",
                                    controller.thck3.toString()),
                                rowData("TK (3%)", "Tanpa Keterangan",
                                    controller.tk.toString()),
                                rowData(
                                    "Tidak Upacara (3%)",
                                    "Pengurangan sebesar 3% per Kegiatan",
                                    controller.tu.toString()),
                                rowData(
                                    "LHKPN/ LHKASN (5%)",
                                    "Pengurangan sebesar 5% jika belum menyampaikan",
                                    controller.lhkpn.toString()),
                                rowData(
                                    "TPTG (5%)",
                                    "Pengurangan sebesar 5% jika belum menyampaikan",
                                    controller.tptgr.toString()),
                                Divider(),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "PD ",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                "Penilian Disiplin",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${controller.subtraction}%",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total Skor DK (Disiplin Kerja)",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: primaryColor),
                                              ),
                                              Text(
                                                "100% - PD",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${controller.dk}%",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(Icons.print_outlined),
                              label: Text(
                                "Rekapitulasi Absen",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () {
                                var month = controller.currentDate!.month;
                                var year = controller.currentDate.year;
                                Get.to(TppPdfView(
                                  month: month,
                                  year: year,
                                ));
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Card(
                          color: Colors.grey[300],
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Perhitungan Skor Disiplin berdasarakan Perbub Barito Timur No 14 Tahun 2023",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Perhitungan Skor Disiplin akan diterbitkan oleh Kasubbag Kepegawaian masing - masing OPD setiap bulannya",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Perhitungan Skor Disiplin lebih rinci berdasarkan Rekapitulasi Kehadiran dapat dicetak pada Aplikasi Administrator oleh Kasubbag Kepegawaian masing - masing OPD",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Text(
                          "Data Skor Disiplin Kerja Anda belum diterbitkan",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<TppView> createState() => TppController();

  Widget rowData(String? title, String? subtitle, String? data) {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle.toString(),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${data}%",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
