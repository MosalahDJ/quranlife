import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/qibla%20compass%20controller/qibla_compass_controller.dart';

class QiblaDirection extends StatelessWidget {
  QiblaDirection({super.key});

  final QiblaCompassController controller = Get.put(QiblaCompassController());

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
          Obx(() {
            if (controller.direction.value != null &&
                controller.qiblaDirection.value != null) {
              return Transform.rotate(
                angle: ((controller.direction.value! -
                        controller.qiblaDirection.value!) *
                    (math.pi /
                        180)), // Removed the -1 multiplier and changed + to -
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
              );
            }
            return const CircularProgressIndicator(
              color: Color(0xFFF9B091),
            );
          }),
          const SizedBox(height: 50),
          Obx(() => Text(
                controller.direction.value != null
                    ? '${controller.direction.value!.toStringAsFixed(1)}°'
                    : 'Calculating...',
                style: TextStyle(
                  color: controller.direction.value != null
                      ? controller.isPointingToQibla()
                          ? Colors.green // Correct direction
                          : Colors.red // Wrong direction
                      : Colors.white, // Default color while calculating
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
