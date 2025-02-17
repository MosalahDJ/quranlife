import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
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
          //gradient background
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/core/assets/images/background_image/paper.jpg'),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildInstructionCard(),
                  const SizedBox(height: 30),
                  _buildKaabaImage(),
                  const SizedBox(height: 40),
                  _buildCompass(),
                  const SizedBox(height: 30),
                  _buildDirectionInfo(),
                ],
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
      height: 150,
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
    return Stack(
      children: [
        SizedBox(
          width: Sizeconfig.screenwidth,
          height: Sizeconfig.screenheight! / 2,
          child: Image.asset(
            'lib/core/assets/images/background_image/qibla_compass.png',
            width: 300,
            height: 300,
          ),
        ),
        Obx(() {
          if (controller.direction.value == null) {
            // return _buildLoadingCompass();
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
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: kmaincolor.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/core/assets/images/background_image/arrw.png',
                        width: 300,
                        height: 300,
                      ),
                      // AnimatedContainer(
                      //   duration: const Duration(milliseconds: 300),
                      //   child: Icon(
                      //     Icons.arrow_upward,
                      //     color: controller.isPointingToQibla()
                      //         ? Colors.green
                      //         : const Color(0xFFF9B091),
                      //     size: 50,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }

  // Widget _buildLoadingCompass() {
  //   return SizedBox(
  //     width: 300,
  //     height: 300,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         Image.asset(
  //           'lib/core/assets/images/background_image/qibla_compass.png',
  //           width: 300,
  //           height: 300,
  //         ),
  //         CircularProgressIndicator(
  //           valueColor: AlwaysStoppedAnimation<Color>(kmaincolor),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
