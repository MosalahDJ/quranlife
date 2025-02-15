import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class QiblaCompassController extends GetxController {
  final Rx<double?> direction = Rx<double?>(null);
  final Rx<double?> qiblaDirection = Rx<double?>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeQibla();
  }

  Future<void> _initializeQibla() async {
    await _checkLocationPermission();
    await _calculateQiblaDirection();
    _startCompassListener();
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  }

  void _startCompassListener() {
    FlutterCompass.events!.listen((event) {
      direction.value = event.heading;
    });
  }

  Future<void> _calculateQiblaDirection() async {
    final Position position = await Geolocator.getCurrentPosition();

    // Mecca coordinates
    const double meccaLat = 21.4225;
    const double meccaLong = 39.8262;

    final double userLat = position.latitude;
    final double userLong = position.longitude;

    // Calculate Qibla direction
    double longDiff = meccaLong - userLong;
    double y = math.sin(longDiff * (math.pi / 180));
    double x = math.cos(userLat * (math.pi / 180)) *
            math.tan(meccaLat * (math.pi / 180)) -
        math.sin(userLat * (math.pi / 180)) *
            math.cos(longDiff * (math.pi / 180));

    double qibla = math.atan2(y, x) * (180 / math.pi);
    qiblaDirection.value = qibla;
  }
}
