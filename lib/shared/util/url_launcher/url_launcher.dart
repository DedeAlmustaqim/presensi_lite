import 'package:atei_bartim/service/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> privacyPolicy() async {
    String url = 'https://presensi.baritotimurkab.go.id/privacy_policy';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Gagal membuka link.';
    }
  }

  static Future<void> playStore() async {
    String url =
        'https://play.google.com/store/apps/details?id=com.digitalnative.atei_bartim';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Gagal membuka link.';
    }
  }

  static Future<void> pdfAbsen({int? month, int? year}) async {
    String url =
        'http://10.191.254.149/presensi/skpd/rekap/view_absen_tpp_pdf/${AuthService.id}/${month}/${year}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Gagal membuka link.';
    }
  }
}
