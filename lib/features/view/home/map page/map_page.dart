import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quranlife/features/controller/map%20controller/map_controller.dart';

class MapSample extends GetView<MapController> {
  const MapSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                style: controller.mapStyle,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: controller.currentPosition.value != null
                      ? LatLng(
                          controller.currentPosition.value!.latitude,
                          controller.currentPosition.value!.longitude,
                        )
                      : const LatLng(0, 0),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController mapController) {
                  controller.mapController.complete(mapController);
                },
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                markers: controller.markers,
                polylines: controller.polylines,
                onTap: (LatLng location) {
                  controller.destinationLocation.value = location;
                  controller.getDirections(location);
                },
              )),
          Obx(() => controller.isLoading.value
              ? Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        Text(
                          'searching_location'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
      floatingActionButton: Obx(() => FloatingActionButton.extended(
            onPressed: controller.isLoading.value
                ? null
                : controller.getCurrentLocation,
            label: Text('my_current_location'.tr),
            icon: const Icon(Icons.location_searching),
          )),
    );
  }
}
