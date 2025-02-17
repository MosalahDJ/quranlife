import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/qibla%20compass%20controller/qibla_compass_controller.dart';

class QiblaDirection extends StatelessWidget {
  QiblaDirection({super.key});

  final QiblaCompassController controller = Get.put(QiblaCompassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: ShimmerText(
          text: 'Qibla Direction'.tr,
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
                    'lib/core/assets/images/background_image/paper.jpg'),
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    _buildInstructionCard(),
                    const SizedBox(height: 20),
                    _buildKaabaImage(),
                    const SizedBox(height: 20),
                    _buildCompass(),
                    const SizedBox(height: 20),
                    _buildDirectionInfo(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black26 : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            FlutterIslamicIcons.kaaba,
            color: kmaincolor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Point the top of your phone towards Qibla',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKaabaImage() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage("lib/core/assets/images/background_image/meecan.png"),
          fit: BoxFit.contain,
        ),
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
            // Rotating arrow
            Obx(() {
              if (controller.direction.value == null) {
                return _buildLoadingCompass();
              }
              return TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: ((controller.direction.value! -
                          controller.qiblaDirection.value!) *
                      (math.pi / 180)),
                ),
                duration: const Duration(milliseconds: 500),
                builder: (context, double value, child) {
                  return Transform.rotate(
                    angle: value,
                    child: Image.asset(
                      'lib/core/assets/images/background_image/arrw.png',
                      width: 300,
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            }),
            // Static compass background
            Image.asset(
              'lib/core/assets/images/background_image/qibla_compass.png',
              width: 300,
              height: 350,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingCompass() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(kmaincolor),
          ),
        ),
      ),
    );
  }

  Widget _buildDirectionInfo() {
    return Obx(() {
      final direction = controller.direction.value;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: direction != null
              ? controller.isPointingToQibla()
                  ? Colors.green.withOpacity(0.2)
                  : Colors.red.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
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
              color: direction != null
                  ? controller.isPointingToQibla()
                      ? Colors.green
                      : Colors.red
                  : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              direction != null
                  ? '${direction.toStringAsFixed(1)}°'
                  : 'Calibrating...',
              style: TextStyle(
                color: direction != null
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
      );
    });
  }
}
