// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationController extends GetxController {
  late String location;
  late String sublocation;
  @override
  onInit() async {
    super.onInit();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    location = prefs.getString("city") == null
        ? "Get Location"
        : prefs.getString("city")!;
    sublocation =
        prefs.getString("street") == null ? "" : prefs.getString("street")!;
  }

  //getting current location
  late SharedPreferences prefs;
  late double latitude;
  late double longtude;

  Future<void> determinePosition() async {
    prefs = await SharedPreferences.getInstance();
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // check if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("permission denied",
            "we can't find your location without enabling Location services,turn it on or try later");
      }

      // check if location permission are enabled.
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("permission denied",
              "we can't find your location without permission, try later");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        Get.snackbar("permission denied forever!!",
            "we can't find your location without permission");
      }

      if (permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        await prefs.setDouble("latitude", position.latitude);
        latitude = prefs.getDouble("latitude")!;
        await prefs.setDouble("longtude", position.longitude);
        longtude = prefs.getDouble("longtude")!;
      }

      //we use this func from geocoding for getting place informations from
      //coordenates
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longtude);
      //city
      await prefs.setString("city", placemarks[0].locality!);
      //street
      await prefs.setString("street", placemarks[0].administrativeArea!);
      update();
    } on LocationServiceDisabledException catch (e) {
      Get.snackbar("$e",
          "Location services are required for getting your position to calculate prayer times");
    } catch (e) {
      print(e);
    } finally {}
  }
}
