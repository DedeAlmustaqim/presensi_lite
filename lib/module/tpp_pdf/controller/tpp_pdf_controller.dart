import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/tpp_pdf_view.dart';

class TppPdfController extends State<TppPdfView> {
  static late TppPdfController instance;
  late TppPdfView view;
  int? month;
  int? year;
  TppPdfController({this.month, this.year});
  @override
  void initState() {
    loadDocument();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  bool isLoading = true;
  late PDFDocument document;

  loadDocument() async {
    print(month);
    print(year);
    setState(() => isLoading = true);
    try {
      document = await PDFDocument.fromURL(
          'http://10.191.254.149/presensi/skpd/rekap/view_absen_tpp_pdf/${AuthService.id}/${month}/${year}',
          clearPreviewCache: true);
      setState(() => isLoading = false);
    } on Exception catch (err) {
      print(err);
      setState(() => isLoading = false);
    }
  }
}
