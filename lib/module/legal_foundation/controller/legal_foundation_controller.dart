import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/legal_foundation_view.dart';

class LegalFoundationController extends State<LegalFoundationView> {
  static late LegalFoundationController instance;
  late LegalFoundationView view;

  @override
  void initState() {
    loadDocument();
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  bool isLoading = true;
  final noCacheConfig = CacheManager(Config(
    'no_cache',
    // Menentukan cache yang kedaluwarsa dalam waktu yang sangat singkat (misalnya, 1 detik)
    stalePeriod: Duration(seconds: 1),
    // Menentukan jumlah file cache maksimum yang dapat disimpan dalam cache (0 untuk menonaktifkan cache)
    maxNrOfCacheObjects: 0,
  ));

  late PDFDocument document;
  loadDocument() async {
    setState(() => isLoading = true);
    try {
      document = await PDFDocument.fromURL(
          'https://presensi.baritotimurkab.go.id/public/dokumen/dasar_hukum.pdf',
          cacheManager: noCacheConfig,
          clearPreviewCache: true);
      setState(() => isLoading = false);
    } on Exception catch (err) {
      print(err);
      setState(() => isLoading = false);
    }
  }
}
