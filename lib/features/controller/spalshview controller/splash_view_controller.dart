import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/times_page_controller.dart';

class SplashViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationcontroller;
  Animation<double>? fadinganimation;
  final LocationController locationctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final DeterminePrayersController prayerctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();
  final GetResponseBody responsectrl = Get.find();
  RxBool isLoading = true.obs;

  tonextpage() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Get.offNamed(
              FirebaseAuth.instance.currentUser != null &&
                      FirebaseAuth.instance.currentUser!.emailVerified
                  ? "onboarding"
                  : "onboarding",
            ));
  }

  @override
  void onInit() async {
    super.onInit();
    animationcontroller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    fadinganimation =
        Tween<double>(begin: .2, end: 1).animate(animationcontroller!);
    animationcontroller?.repeat(reverse: true);
    isLoading(true);
    bool wasDataRefreshed = await responsectrl.initileresponse();

    // Only fetch prayer times if we didn't just refresh the data
    if (!wasDataRefreshed) {
      await fpfctrl.loadPrayerData();
    }

    prayerctrl.determineCurrentPrayer();
    timespagectrl.pagecontroller();
    timespagectrl.getcurrentpage();
    isLoading(false);
    tonextpage();

    // Start periodic check after initial setup
    Get.find<GetResponseBody>().startPeriodicCheck();
  }

  @override
  void onClose() {
    super.onClose();
    SplashViewController().dispose();
  }
}
