import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class QiblaCompassController extends GetxController {
  final Rx<double?> direction = Rx<double?>(null);
  final Rx<double?> qiblaDirection = Rx<double?>(null);
  final RxBool isLoading = true.obs;
  final RxBool isCompassReliable = true.obs;
  final RxString compassErrorMessage = ''.obs;
  bool hasLocationPermission = false;
  bool isLocationEnabled = false;

  @override
  void onInit() {
    super.onInit();
    _initializeQibla();
  }

  Future<void> _initializeQibla() async {
    isLoading.value = true;
    await checkLocationPermission();
    if (hasLocationPermission && isLocationEnabled) {
      await calculateQiblaDirection();
      startCompassListener();
    }
    isLoading.value = false;
  }

  Future<void> retryInitialization() async {
    isLoading.value = true;
    update();

    await checkLocationPermission();
    if (hasLocationPermission && isLocationEnabled) {
      await calculateQiblaDirection();
      startCompassListener();
    }

    isLoading.value = false;
    update();
  }

  Future<void> checkLocationPermission() async {
    try {
      // Check and request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      hasLocationPermission = permission != LocationPermission.denied &&
          permission != LocationPermission.deniedForever;

      // Check if location services are enabled
      isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        Get.snackbar("location_disabled".tr, "location_services_required".tr,
            colorText: Colors.black87);
        update();
        return;
      }

      if (hasLocationPermission && isLocationEnabled) {
        await calculateQiblaDirection();
        startCompassListener();
      }

      update();
    } catch (e) {
      hasLocationPermission = false;
      update();
    }
  }

  void startCompassListener() {
    try {
      // التحقق من توفر البوصلة
      if (FlutterCompass.events == null) {
        compassErrorMessage.value = "compass_not_available".tr;
        isCompassReliable.value = false;
        update();
        return;
      }

      FlutterCompass.events!.listen((event) {
        // التحقق من موثوقية البوصلة
        if (event.heading == null) {
          compassErrorMessage.value = "compass_reading_unavailable".tr;
          isCompassReliable.value = false;
          update();
          return;
        }

        direction.value = event.heading;

        // التحقق من دقة البوصلة إذا كانت متوفرة
        if (event.accuracy != null) {
          if (event.accuracy! <= 2) {
            isCompassReliable.value = false;
            compassErrorMessage.value = "compass_unreliable".tr;
          } else {
            isCompassReliable.value = true;
            compassErrorMessage.value = '';
          }
        }

        update();
      });
    } catch (e) {
      compassErrorMessage.value = "compass_error".tr;
      isCompassReliable.value = false;
      update();
    }
  }

  Future<void> calculateQiblaDirection() async {
    try {
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
    } catch (e) {
      // print(e);
    }
  }

  bool isPointingToQibla() {
    if (direction.value == null || qiblaDirection.value == null) return false;

    // Calculate the difference between current direction and Qibla direction
    double diff = (direction.value! - qiblaDirection.value!).abs() % 360;

    // Consider it correct if within 10 degrees of accuracy
    return diff <= 10 || diff >= 350;
  }

  // طريقة لإعادة معايرة البوصلة
  void recalibrateCompass() {
    Get.snackbar(
      "calibrate_compass".tr,
      "calibration_instructions".tr,
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.amber.withValues(alpha: 0.7),
      colorText: Colors.black87,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
