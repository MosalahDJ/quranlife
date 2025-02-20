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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: ShimmerText(
            text: 'tasbih'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(children: [
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 15),
                  _buildTasbihText(),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Container(
                      width: Sizeconfig.screenwidth,
                      decoration: BoxDecoration(
                          color: kmaincolor3dark,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(40))),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildTextbutton(text: "33"),
                                _buildIconbutton(icon: Icons.vibration),
                                _buildIconbutton(icon: Icons.refresh_rounded),
                              ],
                            ),
                            SizedBox(height: Sizeconfig.screenheight! / 18),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
  }

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
                    color: Colors.black.withOpacity(0.2),
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
                    'سبح',
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

  Widget _buildTasbihText() {
    return SizedBox(
      height: Sizeconfig.screenheight! / 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<TasbihController>(
            builder: (c) => Text(
              controller.tasbivalue,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontFamily: 'Amiri',
              ),
            ),
          ),
          DropdownButton(
            value: controller.tasbivalue,
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              size: 30,
              color: Colors.black,
            ),
            items: [
              DropdownMenuItem(
                  value: controller.tasbihtext[0],
                  child: Text(controller.tasbihtext[0])),
              DropdownMenuItem(
                  value: controller.tasbihtext[1],
                  child: Text(controller.tasbihtext[1])),
              DropdownMenuItem(
                  value: controller.tasbihtext[2],
                  child: Text(controller.tasbihtext[2])),
            ],
            onChanged: (value) {
              controller.tasbivalue = value!;
              controller.update();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconbutton({required IconData icon}) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
                style: BorderStyle.solid)),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            fixedSize:
                WidgetStatePropertyAll(Size(Sizeconfig.screenwidth! / 4, 40)),
            backgroundColor: WidgetStatePropertyAll(kmaincolor3),
          ),
          child: Icon(
            icon,
            color: kmaincolor3dark,
          ),
        ));
  }

  Widget _buildTextbutton({required String text}) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
                style: BorderStyle.solid)),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            fixedSize:
                WidgetStatePropertyAll(Size(Sizeconfig.screenwidth! / 4, 40)),
            backgroundColor: WidgetStatePropertyAll(kmaincolor3),
          ),
          child: Text(
            text,
            style: TextStyle(color: kmaincolor3dark),
          ),
        ));
  }

  Widget _buildCounter() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
              style: BorderStyle.solid)),
      child: ElevatedButton.icon(
        onPressed: controller.resetCounter,
        label: Obx(() => Text(
              '${controller.counter} of ${controller.targetCount}',
              style: TextStyle(
                color: kmaincolor3dark,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Amiri',
              ),
            )),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(Sizeconfig.screenwidth! / 1.2, 60),
          backgroundColor: kmaincolor3,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
