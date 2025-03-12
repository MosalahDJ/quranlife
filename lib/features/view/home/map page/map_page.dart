import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/core/Utils/constants.dart';
import 'package:project/features/controller/map%20controller/map_controller.dart';


class MapSample extends StatelessWidget {
  const MapSample({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          GetBuilder<MapController>(
            builder:
                (controller) => GoogleMap(
                  style: controller.mapStyle,
                  mapType: MapType.normal,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(35, 6),
                    zoom: 0,
                  ),
                  onMapCreated: controller.onMapCreated,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  markers: controller.markers,
                ),
          ),
          Obx(
            () =>
                controller.isLoading.value
                    ? Container(
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 16.0,
                          ),
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
                    : const SizedBox.shrink(),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          backgroundColor: Get.isDarkMode ? kmaincolor : kmaincolor3,
          foregroundColor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          onPressed:
              controller.isLoading.value ? null : controller.getCurrentLocation,
          label: Text(
            'my_current_location'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.location_searching),
        ),
      ),
    );
  }
}
