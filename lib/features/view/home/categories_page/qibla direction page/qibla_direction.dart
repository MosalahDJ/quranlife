import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class QiblaDirection extends StatefulWidget {
  const QiblaDirection({super.key});

  @override
  State<QiblaDirection> createState() => _QiblaDirectionState();
}

class _QiblaDirectionState extends State<QiblaDirection> {
  double? direction;
  double? qiblaDirection;

  @override
  void initState() {
    super.initState();
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
      setState(() {
        direction = event.heading;
      });
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
    setState(() {
      qiblaDirection = qibla;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040C23),
      appBar: AppBar(
        title: const Text('Qibla Direction',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF040C23),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Point the top of your phone towards Qibla',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          if (direction != null && qiblaDirection != null)
            Transform.rotate(
              angle: ((direction! + qiblaDirection!) * (math.pi / 180) * -1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'lib/core/assets/images/background_image/qibla_comppas.png',
                    width: 300,
                    height: 300,
                  ),
                  const Icon(
                    Icons.arrow_upward,
                    color: Color(0xFFF9B091),
                    size: 50,
                  ),
                ],
              ),
            )
          else
            const CircularProgressIndicator(
              color: Color(0xFFF9B091),
            ),
          const SizedBox(height: 50),
          Text(
            direction != null
                ? '${direction!.toStringAsFixed(1)}°'
                : 'Calculating...',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
