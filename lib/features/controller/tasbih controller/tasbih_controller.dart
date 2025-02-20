import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class TasbihController extends GetxController with GetTickerProviderStateMixin {
  final counter = 0.obs;
  final targetCount = 33.obs;
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void incrementCounter() {
    if (counter.value < targetCount.value) {
      HapticFeedback.lightImpact();
      counter.value++;
      counter.value == targetCount.value ? counter.value = 0 : null;
      animationController.forward(from: 0.0);
    }
  }

  void resetCounter() {
    HapticFeedback.mediumImpact();
    counter.value = 0;
  }

  String? tasbihvalue ;

  List<String> tasbihtext = [
    "سبحان الله",
    "الحمد الله",
    "الله أكبر",
  ];

  int? maxcountvalue ;

  List<int> maxcount = [
    33,
    66,
   99,
   100,
  ];
}
