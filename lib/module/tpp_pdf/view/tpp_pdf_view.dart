import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../controller/tpp_pdf_controller.dart';

class TppPdfView extends StatefulWidget {
  final int? month;
  final int? year;
  TppPdfView({Key? key, this.month, this.year}) : super(key: key);

  Widget build(context, TppPdfController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Rekapitulasi Absen"),
            Spacer(),
            const Icon(
              Icons.download,
              size: 24.0,
              color: Colors.white,
            ),
            ZoomTapAnimation(
              onTap: () {
                UrlLauncher.pdfAbsen(
                  month: month,
                  year: year,
                );
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Download",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: SafeArea(
        child: Center(
          child: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PDFViewer(
                  showNavigation: true,

                  scrollDirection: Axis.vertical,
                  showIndicator: true,
                  document: controller.document,
                  lazyLoad: true,
                  // zoomSteps: 1,
                  numberPickerConfirmWidget: const Text(
                    "Confirm",
                  ),
                ),
        ),
      ),
    );
  }

  @override
  State<TppPdfView> createState() => TppPdfController(month: month, year: year);
}
