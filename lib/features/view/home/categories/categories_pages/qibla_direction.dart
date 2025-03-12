import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/core/widgets/skeletonizer.dart';
import 'package:project/features/controller/qibla%20compass%20controller/qibla_compass_controller.dart';

class QiblaDirection extends StatelessWidget {
  QiblaDirection({super.key});

  final QiblaCompassController controller = Get.put(QiblaCompassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: ShimmerText(
          textcolor: Colors.black,
          text: 'qibla_direction'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/images/background_image/paper.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return _buildSkeletonLayout();
            }
            return GetBuilder<QiblaCompassController>(
              builder: (controller) {
                if (!controller.hasLocationPermission ||
                    !controller.isLocationEnabled) {
                  return _buildLocationPermissionRequest();
                }
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          _buildCalibrationOverlay(),
                          const SizedBox(height: 20),
                          _buildKaabaImage(),
                          _buildCompass(),
                          const SizedBox(height: 5),
                          _buildDirectionInfo(),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSkeletonLayout() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Myskeletonizer(
              skeletonizerWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildCalibrationOverlay(),
              ),
            ),
            const SizedBox(height: 20),
            _buildKaabaImage(),
            const SizedBox(height: 20),
            Image.asset(
              'lib/core/assets/images/compass/qibla_compass.png',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Myskeletonizer(
              skeletonizerWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildDirectionInfo(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationPermissionRequest() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_disabled,
              size: 64,
              color: Colors.black87,
            ),
            const SizedBox(height: 16),
            Text(
              'location_permission_required'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'enable_location_description'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(kmaincolor4),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(color: kmaincolor4, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () async {
                await controller.retryInitialization();
              },
              child: Text('retry_permission'.tr),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKaabaImage() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Image.asset(
        "lib/core/assets/images/compass/meecan.png",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCompass() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(() {
              if (controller.direction.value == null ||
                  controller.qiblaDirection.value == null) {
                return Image.asset(
                  'lib/core/assets/images/compass/arrw.png',
                  width: 300,
                  height: 350,
                  fit: BoxFit.contain,
                );
              }
              return TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end:
                      ((controller.direction.value! -
                              controller.qiblaDirection.value!) *
                          (math.pi / 180)),
                ),
                duration: const Duration(milliseconds: 500),
                builder: (context, double value, child) {
                  return Transform.rotate(
                    angle: value,
                    child: Image.asset(
                      'lib/core/assets/images/compass/arrw.png',
                      width: 300,
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            }),
            Image.asset(
              'lib/core/assets/images/compass/qibla_compass.png',
              width: 300,
              height: 350,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectionInfo() {
    return Obx(() {
      final direction = controller.direction.value;
      return Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color:
                  direction != null
                      ? controller.isPointingToQibla()
                          ? Colors.green.withValues(alpha: 0.2)
                          : Colors.red.withValues(alpha: 0.2)
                      : Colors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  direction != null
                      ? controller.isPointingToQibla()
                          ? Icons.check_circle
                          : Icons.info
                      : Icons.sync,
                  color:
                      direction != null
                          ? controller.isPointingToQibla()
                              ? Colors.green
                              : Colors.red
                          : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  direction != null
                      ? '${direction.toStringAsFixed(1)}°'
                      : 'calibrating'.tr,
                  style: TextStyle(
                    color:
                        direction != null
                            ? controller.isPointingToQibla()
                                ? Colors.green
                                : Colors.red
                            : Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: direction != null ? controller.isPointingToQibla() : false,
            child: Text(
              'in_direction'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.green),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildCalibrationOverlay() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/core/assets/images/compass/calibrating_image.png',
              width: 100,
              height: 50,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 10),
            Text(
              'move_phone_figure8'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
            const SizedBox(height: 10),
            Text(
              'magnetic'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
