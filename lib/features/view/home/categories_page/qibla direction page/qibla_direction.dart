import 'dart:math' as math;
import 'package:flutter/material.dart';
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
                    'lib/core/assets/images/background_image/arch.jpg'),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: Sizeconfig.screenwidth,
              height: Sizeconfig.screenheight,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Point the top of your phone towards Qibla',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Image.asset(
                        "lib/core/assets/images/background_image/meeca2.png"),
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
                      return Image.asset(
                        'lib/core/assets/images/background_image/qibla_comppas.png',
                        width: 300,
                        height: 300,
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
                                : Get.isDarkMode
                                    ? Colors.white
                                    : Colors
                                        .black, // Default color while calculating
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
