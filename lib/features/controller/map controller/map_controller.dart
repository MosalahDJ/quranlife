import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final Rx<Position?> currentPosition = Rx<Position?>(null);
  final RxBool isLoading = false.obs;
  final RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? _controller;
  bool _disposed = false;

  static const String latkey = 'last_known_latitude';
  static const String lngkey = 'last_known_longitude';

  final String mapStyle = '''
  [
    {
      "featureType": "poi",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi.place_of_worship",
      "elementType": "geometry",
      "stylers": [
        {
          "visibility": "on"
        }
      ]
    },
    {
      "featureType": "poi.place_of_worship",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "on"
        }
      ]
    }
  ]
  ''';

  @override
  void onInit() {
    super.onInit();
    if (_controller == null) {
      mapController = Completer<GoogleMapController>();
      _disposed = false;
    }
  }

  @override
  void onClose() {
    _disposed = true;
    _controller?.dispose();
    clearLocationCache();
    _controller = null;
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    if (!_disposed && !mapController.isCompleted) {
      _controller = controller;
      mapController.complete(controller);
      getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    if (_disposed || _controller == null) return;

    isLoading.value = true;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Get.dialog(
          AlertDialog(
            title: Text('location_service_disabled'.tr),
            content: Text('enable_gps_message'.tr),
            actions: [
              TextButton(
                child: Text('cancel'.tr),
                onPressed: () => Get.back(),
              ),
              TextButton(
                child: Text('open_settings'.tr),
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                  Get.back();
                },
              ),
            ],
          ),
        );
        isLoading.value = false;
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            'permission_denied'.tr,
            'location_permission_required'.tr,
            snackPosition: SnackPosition.BOTTOM,
          );
          isLoading.value = false;
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        await Get.dialog(
          AlertDialog(
            title: Text('permission_denied_permanently'.tr),
            content: Text('enable_permission_settings'.tr),
            actions: [
              TextButton(
                child: Text('ok'.tr),
                onPressed: () => Get.back(),
              ),
              TextButton(
                child: Text('open_settings'.tr),
                onPressed: () async {
                  await Geolocator.openAppSettings();
                  Get.back();
                },
              ),
            ],
          ),
        );
        isLoading.value = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      currentPosition.value = position;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(latkey, position.latitude);
      await prefs.setDouble(lngkey, position.longitude);

      await _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 17,
          ),
        ),
      );
    } catch (e) {
      // print('Error getting location: $e');
    } finally {
      if (!_disposed) {
        isLoading.value = false;
      }
    }
  }
  Future<void> clearLocationCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(latkey);
    await prefs.remove(lngkey);
  }
}
