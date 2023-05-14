import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longtide;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtide = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
