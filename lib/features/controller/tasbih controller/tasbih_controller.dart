import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

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
    checkVibrationSupport();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void resetCounter() {
    HapticFeedback.mediumImpact();
    counter.value = 0;
  }

  final RxBool isVibrationEnabled = true.obs;

  // void toggleVibration() {
  //   isVibrationEnabled.value = !isVibrationEnabled.value;
  //   update();
  // }

  // void incrementCounter() {
  //   if (counter.value < targetCount.value) {
  //     if (isVibrationEnabled.value) {
  //       HapticFeedback.lightImpact();
  //     }
  //     counter.value++;
  //     animationController.forward(from: 0.0);
  //   }
  // }

   // تعديل دالة التبديل
  void toggleVibration() {
    isVibrationEnabled.value = !isVibrationEnabled.value;
    // اختبار الاهتزاز عند التبديل
    if (isVibrationEnabled.value) {
      HapticFeedback.heavyImpact();
    }
    update();
  }

  // تعديل دالة زيادة العداد
  void incrementCounter() {
    if (counter.value < targetCount.value) {
      try {
        if (isVibrationEnabled.value) {
          // استخدام نوع مختلف من الاهتزاز
          HapticFeedback.selectionClick();
        }
        counter.value++;
        animationController.forward(from: 0.0);
      } catch (e) {
        print('Vibration error: $e');
      }
    }
  }

  // إضافة دالة للتحقق من دعم الاهتزاز
  Future<void> checkVibrationSupport() async {
    try {
      await HapticFeedback.vibrate();
    } catch (e) {
      print('Device might not support vibration: $e');
    }
  }

}
