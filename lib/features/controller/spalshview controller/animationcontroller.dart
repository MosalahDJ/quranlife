import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/view/home/home_page.dart';
import 'package:quranlife/features/view/onboarding%20pages/on_boarding_view.dart';

class Animationcontrollers extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationcontroller;
  Animation<double>? fadinganimation;

  tonextpage() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(
        () => FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified
            ? HomePage()
            : const OnBoardingView(),
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
    Animationcontrollers().dispose();
  }
}
