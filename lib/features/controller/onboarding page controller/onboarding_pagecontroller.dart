import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPagecontroller extends GetxController {
  PageController pagecontroller = PageController();

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
  }

  @override
  void onClose() {
    pagecontroller.dispose();
    super.onClose();
  }
}
