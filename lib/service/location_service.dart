import 'package:geolocator/geolocator.dart';

class LocationService {
  Future getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      print(e);
    }
  }
}
