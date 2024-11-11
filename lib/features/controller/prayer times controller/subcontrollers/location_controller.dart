// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  //getting current location

  late double latitude;
  late double longtude;
  RxString location = "Get Location".obs;
  RxString sublocation = "".obs;

  Future<void> determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // check if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("Geolocator ERR 1 : Location services are disabled");
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
        latitude = position.latitude;
        longtude = position.longitude;
      }

      //we use this func from geocoding for getting place informations from
      //coordenates
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longtude);
      //city
      location.value = placemarks[0].locality!;
      //street
      sublocation.value = placemarks[0].administrativeArea!;
    } on LocationServiceDisabledException catch (e) {
      Get.snackbar("$e",
          "Location services are required for getting your position to calculate prayer times");
    } catch (e) {
      print(e);
    } finally {}
  }
}
