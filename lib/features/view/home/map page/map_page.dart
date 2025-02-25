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
          GetBuilder<MapController>(
            builder: (controller) => GoogleMap(
              style: controller.mapStyle,
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(10, 10),
                zoom: 17,
              ),
              onMapCreated: controller.onMapCreated,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              markers: controller.markers,
              onTap: controller.onTapMap,
            ),
          ),
          Obx(() => controller.isLoading.value
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 16.0),
                          Text(
                            'searching_location'.tr,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
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
