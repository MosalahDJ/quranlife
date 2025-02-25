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
  static const String timestampkey = 'location_timestamp';
  static const int maxcaxhage = 30 * 60 * 1000; // 30 minutes in milliseconds

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
    getCurrentLocation();
  }

  @override
  void onClose() {
    _disposed = true;
    _controller?.dispose();
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    if (!_disposed && !mapController.isCompleted) {
      _controller = controller;
      mapController.complete(controller);
      // controller.setMapStyle(mapStyle);
    }
  }

  Future<void> getCurrentLocation() async {
    if (_disposed) return;

    isLoading.value = true;
    try {
      // التحقق من الموقع المخزن مؤقتاً
      final prefs = await SharedPreferences.getInstance();
      final cachedLat = prefs.getDouble(latkey);
      final cachedLng = prefs.getDouble(lngkey);
      final timestamp = prefs.getInt(timestampkey) ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;

      // استخدام الموقع المخزن إذا كان حديثاً
      if (cachedLat != null &&
          cachedLng != null &&
          (now - timestamp) < maxcaxhage) {
        await _updateMapLocation(LatLng(cachedLat, cachedLng));
        isLoading.value = false;
        return;
      }

      // التحقق من إذن الموقع
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

      // تخزين الموقع الجديد
      await prefs.setDouble(latkey, position.latitude);
      await prefs.setDouble(lngkey, position.longitude);
      await prefs.setInt(timestampkey, now);

      await _updateMapLocation(LatLng(position.latitude, position.longitude));
    } catch (e) {
      print('Error getting location: $e');
    } finally {
      if (!_disposed) {
        isLoading.value = false;
      }
    }
  }

  Future<void> _updateMapLocation(LatLng location) async {
    if (!_disposed && _controller != null) {
      try {
        await _controller!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: location,
              zoom: 17,
            ),
          ),
        );
      } catch (e) {
        print('Error animating camera: $e');
        _controller = null;
        mapController = Completer<GoogleMapController>();
      }
    }
  }

  void onTapMap(LatLng location) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: location,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  Future<void> clearLocationCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(latkey);
    await prefs.remove(lngkey);
    await prefs.remove(timestampkey);
  }
}
