import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationcontroller;
  Animation<double>? fadinganimation;

  tonextpage() {
    Future.delayed(const Duration(seconds: 0), () {
      Get.offNamed(
        FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified
            ? "test"
            : "test",
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    animationcontroller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    fadinganimation =
        Tween<double>(begin: .2, end: 1).animate(animationcontroller!);

    animationcontroller?.repeat(reverse: true);

    tonextpage();
  }

  @override
  void onClose() {
    super.onClose();
    SplashViewController().dispose();
  }
}
