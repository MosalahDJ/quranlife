import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:project/features/controller/fcm%20controllers/fcm_controller.dart';

class OnboardingPagecontroller extends GetxController {
  PageController pagecontroller = PageController();
  // final FCMController notictrl = Get.find();

  int? currentPage;
  @override
  void onInit() {
    super.onInit();
    //w made the page controller here on init state for lunching whene the page
    //open and we add a listener to it let it value change if we change the page
    //also we use the update for refreshing the ui if the value change
    pagecontroller.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        currentPage = pagecontroller.page!.toInt();
        update();
      });
    });
    // // ignore: unnecessary_null_comparison
    // if (notictrl.adhansubscribition == null) {
    //   Get.defaultDialog(
    //     textConfirm: "confirm",
    //     onConfirm: notictrl.subscribetotopic("Adhan"),
    //     textCancel: "cancel",
    //     onCancel: notictrl.unsbscribefrometopic("Adhan"),
    //   );
    // } else {
    //   null;
    // }
  }

  @override
  void onClose() {
    pagecontroller.dispose();
    super.onClose();
  }
}
