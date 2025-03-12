import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/statistics%20controller/statistics_controller.dart';
import 'package:project/features/controller/tasbih%20controller/tasbih_controller.dart';

class Tasbih extends StatelessWidget {
  Tasbih({super.key});

  final TasbihController controller = Get.put(TasbihController());
  final StatisticsController statctrl = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _buildBody(context),
    );
  }

  // App Bar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: ShimmerText(
        text: 'tasbih'.tr,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  // Main Body
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        // Background gradient
        Gradientbackground(
          height: Sizeconfig.screenheight! / 2.5,
          gradientcolor: [
            kmaincolor,
            Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
          ],
        ),
        // Pattern overlay
        _buildBackgroundPattern(),
        // Main content
        SafeArea(
          bottom: false,
          child: SizedBox(
            width: Sizeconfig.screenwidth,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 15),
                  _buildTasbihText(),
                  const SizedBox(height: 15),
                  _buildBottomContainer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Background pattern
  Widget _buildBackgroundPattern() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/core/assets/images/background_image/arch.jpg'),
          opacity: 0.2,
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }

  // Bottom container with rounded top corners
  Widget _buildBottomContainer() {
    return Container(
      width: Sizeconfig.screenwidth,
      decoration: BoxDecoration(
        color: kmaincolor3dark.withValues(alpha: 0.8),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: Sizeconfig.screenheight! / 18),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCounter(),
                SizedBox(height: Sizeconfig.screenheight! / 18),
                _buildTasbihBead(),
                SizedBox(height: Sizeconfig.screenheight! / 18),
                _buildControlButtons(),
              ],
            ),
            SizedBox(height: Sizeconfig.screenheight! / 18),
          ],
        ),
      ),
    );
  }

  // Control buttons row
  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMaxCountButton(),
        _buildVibrationButton(),
        _buildResetButton(),
      ],
    );
  }

  // Interactive tasbih bead
  Widget _buildTasbihBead() {
    return GestureDetector(
      onTap: () {
        controller.incrementCounter();
        statctrl.incrementTotalDuaasRead();
        HapticFeedback.mediumImpact();
      },
      child: AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - (controller.animationController.value * 0.05),
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: textcolor3,
                boxShadow: [
                  BoxShadow(
                    color: kmaincolor3dark.withValues(alpha: 0.3),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    spreadRadius: -2,
                    blurRadius: 15,
                    offset: const Offset(-5, -5),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Inner circle decoration
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: 0.2),
                          Colors.transparent,
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 2,
                      ),
                    ),
                  ),
                  // Text and icon content
                  Container(
                    alignment: Alignment.center,
                    width: 140,
                    height: 140,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'press'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                offset: const Offset(1, 1),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.touch_app_rounded,
                          color: Colors.white.withValues(alpha: 0.9),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Dropdown for tasbih text selection
  Widget _buildTasbihText() {
    return Center(
      child: Container(
        width: Sizeconfig.screenwidth! * 0.9,
        height: Sizeconfig.screenheight! / 5,
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: BoxConstraints(
          minHeight: Sizeconfig.screenheight! / 8,
          maxHeight: Sizeconfig.screenheight! / 3,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: kmaincolor3.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00100C).withValues(alpha: 0.15),
              blurRadius: 15,
              offset: const Offset(0, 5),
              spreadRadius: 2,
            ),
          ],
        ),
        child: GetBuilder<TasbihController>(
          builder: (controller) {
            return Theme(
              data: Theme.of(Get.context!).copyWith(
                textTheme: Theme.of(Get.context!).textTheme.apply(
                  fontFamily: 'Amiri',
                  bodyColor: const Color(0xFF00100C),
                  displayColor: const Color(0xFF00100C),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  elevation: 3,
                  alignment: Alignment.center,
                  dropdownColor: kmaincolor3,
                  value: controller.tasbihvalue ?? controller.tasbihtext[0],
                  borderRadius: BorderRadius.circular(16.0),
                  icon: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00100C).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Color(0xFF00100C),
                    ),
                  ),
                  menuMaxHeight: Sizeconfig.screenheight! * 0.5,
                  itemHeight: 60,
                  items:
                      controller.tasbihtext.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            child: Text(
                              value,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF00100C),
                                fontSize: 22,
                                fontFamily: 'Amiri',
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }).toList(),
                  onChanged: (value) {
                    controller.tasbihvalue = value!;
                    controller.resetCounter();
                    controller.update();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Icon button with container border
  Widget _buildResetButton() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: ElevatedButton(
        onPressed: controller.resetCounter,
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(
            Size(Sizeconfig.screenwidth! / 5, 40),
          ),
          backgroundColor: WidgetStatePropertyAll(kmaincolor3),
        ),
        child: const Icon(Icons.refresh_rounded, color: Color(0xFF00100C)),
      ),
    );
  }

  // Icon button with container border
  Widget _buildVibrationButton() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Obx(
        () => ElevatedButton(
          onPressed: controller.toggleVibration,
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(
              Size(Sizeconfig.screenwidth! / 5, 40),
            ),
            backgroundColor: WidgetStateProperty.all(
              controller.isVibrationEnabled.value
                  ? kmaincolor3
                  : Colors.grey.shade400,
            ),
            elevation: WidgetStateProperty.all(
              controller.isVibrationEnabled.value ? 4 : 0,
            ),
          ),
          child: Icon(
            Icons.vibration,
            color:
                controller.isVibrationEnabled.value
                    ? const Color(0xFF00100C)
                    : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  // Max count dropdown button
  Widget _buildMaxCountButton() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: Sizeconfig.screenwidth! / 5,
        decoration: BoxDecoration(
          color: kmaincolor3,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: GetBuilder<TasbihController>(
          builder: (controller) {
            return DropdownButton<int>(
              dropdownColor: kmaincolor3,
              value: controller.targetCount.value,
              borderRadius: BorderRadius.circular(12.0),
              underline: Container(),
              icon: const Icon(
                Icons.arrow_drop_up_outlined,
                size: 30,
                color: Color(0xFF00100C),
              ),
              style: const TextStyle(
                color: Color(0xFF00100C),
                fontSize: 34,
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
              ),
              items:
                  controller.maxcount.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        "$value",
                        style: const TextStyle(
                          color: Color(0xFF00100C),
                          fontSize: 18,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                controller.targetCount.value = value!;
                controller.update();
              },
            );
          },
        ),
      ),
    );
  }

  // Counter display
  Widget _buildCounter() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        color: kmaincolor3.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00100C).withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
            spreadRadius: 2,
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${controller.counter}',
                  style: const TextStyle(
                    color: Color(0xFF00100C),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "sur".tr,
                  style: TextStyle(
                    color: const Color(0xFF00100C).withValues(alpha: 0.7),
                    fontSize: 24,
                    fontFamily: 'Amiri',
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${controller.targetCount}',
                  style: const TextStyle(
                    color: Color(0xFF00100C),
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Amiri',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            final progress =
                controller.counter.value / controller.targetCount.value;
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 6,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: progress),
                  duration: const Duration(milliseconds: 250),
                  builder:
                      (context, value, _) => LinearProgressIndicator(
                        value: value,
                        backgroundColor: Colors.white.withValues(alpha: 0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFF00100C).withValues(alpha: 0.7),
                        ),
                        minHeight: 6,
                      ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
