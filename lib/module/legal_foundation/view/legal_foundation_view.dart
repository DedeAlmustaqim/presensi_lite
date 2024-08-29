import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/legal_foundation_controller.dart';

class LegalFoundationView extends StatefulWidget {
  const LegalFoundationView({Key? key}) : super(key: key);

  Widget build(context, LegalFoundationController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dasar Hukum"),
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
  State<LegalFoundationView> createState() => LegalFoundationController();
}
