import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/adkar_controller/tasbih_controller.dart';
import 'dart:math' as math;

class Tasbih extends StatelessWidget {
  Tasbih({super.key});

  final TasbihController controller = Get.put(TasbihController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'المسبحة',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Amiri',
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCounter(),
          const SizedBox(height: 40),
          _buildTasbihBead(),
          const SizedBox(height: 40),
          _buildResetButton(),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Obx(() => Text(
          '${controller.counter} / ${controller.targetCount}',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Amiri',
          ),
        ));
  }

  Widget _buildTasbihBead() {
    return GestureDetector(
      onTap: controller.incrementCounter,
      child: AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.animationController.value * 2 * math.pi / 8,
            child: Container(
              width: 200,
              height: 200,
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
              child: const Center(
                child: Text(
                  'سبح',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResetButton() {
    return ElevatedButton.icon(
      onPressed: controller.resetCounter,
      icon: const Icon(Icons.refresh),
      label: const Text(
        'إعادة تعيين',
        style: TextStyle(fontFamily: 'Amiri'),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[400],
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
