import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/tasbih%20controller/tasbih_controller.dart';
import 'dart:math' as math;

class Tasbih extends StatelessWidget {
  Tasbih({super.key});

  final TasbihController controller = Get.put(TasbihController());

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
          child: SizedBox(
            width: Sizeconfig.screenwidth,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 15),
                _buildTasbihText(),
                const SizedBox(height: 15),
                _buildBottomContainer(),
              ],
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
    return Expanded(
      child: Container(
        width: Sizeconfig.screenwidth,
        decoration: BoxDecoration(
          color: kmaincolor3dark.withOpacity(0.8),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: Sizeconfig.screenheight! / 18),
              _buildCounter(),
              SizedBox(height: Sizeconfig.screenheight! / 18),
              _buildTasbihBead(),
              SizedBox(height: Sizeconfig.screenheight! / 18),
              _buildControlButtons(),
              SizedBox(height: Sizeconfig.screenheight! / 18),
            ],
          ),
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
        _buildIconButton(
          icon: Icons.vibration,
          onPressed: () {},
        ),
        _buildIconButton(
          icon: Icons.refresh_rounded,
          onPressed: controller.resetCounter,
        ),
      ],
    );
  }

  // Interactive tasbih bead
  Widget _buildTasbihBead() {
    return GestureDetector(
      onTap: controller.incrementCounter,
      child: AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.animationController.value * 2 * math.pi,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.teal[700]!,
                    Colors.teal[500]!,
                    Colors.teal[300]!,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00100C).withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'اظغط للعد',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Amiri',
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
    return SizedBox(
      height: Sizeconfig.screenheight! / 3,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00100C).withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: GetBuilder<TasbihController>(
            builder: (controller) {
              return DropdownButton<String>(
                dropdownColor: Colors.white,
                value: controller.tasbihvalue ?? controller.tasbihtext[0],
                borderRadius: BorderRadius.circular(12.0),
                underline: Container(),
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  size: 30,
                  color: Color(0xFF00100C),
                ),
                style: const TextStyle(
                  color: Color(0xFF00100C),
                  fontSize: 34,
                  fontFamily: 'Amiri',
                  fontWeight: FontWeight.bold,
                ),
                items: controller.tasbihtext.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xFF00100C),
                        fontSize: 18,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.tasbihvalue = value!;
                  controller.update();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // Icon button with container border
  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          fixedSize:
              WidgetStatePropertyAll(Size(Sizeconfig.screenwidth! / 4, 40)),
          backgroundColor: WidgetStatePropertyAll(kmaincolor3),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF00100C),
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
          color: Colors.white.withOpacity(0.3),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: Sizeconfig.screenwidth! / 4,
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
              items: controller.maxcount.map((int value) {
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: controller.resetCounter,
        label: Obx(
          () => Text(
            '${controller.counter} من ${controller.targetCount}',
            style: const TextStyle(
              color: Color(0xFF00100C),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Amiri',
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(Sizeconfig.screenwidth! / 1.2, 70),
          backgroundColor: kmaincolor3,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
