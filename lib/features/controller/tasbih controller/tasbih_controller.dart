import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class TasbihController extends GetxController with GetTickerProviderStateMixin {
  final counter = 0.obs;
  RxInt targetCount = 33.obs;
  List<int> maxcount = [
    33,
    66,
    99,
    100,
  ];
  late AnimationController animationController;
  String? tasbihvalue;
  List<String> tasbihtext = [
    "سبحان الله",
    "الحمد الله",
    "الله أكبر",
    "سبحان الله و بحمده",
    "سبحان الله العضيم",
  ];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _checkVibrationSupport();
  }

  @override
  void onClose() {
    Vibration.cancel();
    animationController.dispose();
    super.onClose();
  }

  void resetCounter() {
    if (isVibrationEnabled.value) {
      Vibration.vibrate(duration: 100, amplitude: 192);
    }
    counter.value = 0;
  }

  final RxBool isVibrationEnabled = true.obs;

  Future<void> _checkVibrationSupport() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator != true) {
      isVibrationEnabled.value = false;
    }
  }

  void toggleVibration() {
    isVibrationEnabled.value = !isVibrationEnabled.value;
    if (isVibrationEnabled.value) {
      Vibration.vibrate(duration: 75, amplitude: 128);
    }
    update();
  }

  void incrementCounter() {
    if (counter.value < targetCount.value) {
      if (isVibrationEnabled.value) {
        Vibration.vibrate(duration: 50, amplitude: 128);
      }
      counter.value++;
      animationController.forward(from: 0.0);
    }
  }

  Future<void> checkVibrationSupport() async {
    try {
      await HapticFeedback.vibrate();
    } catch (e) {
      print('Device might not support vibration: $e');
    }
  }
}
