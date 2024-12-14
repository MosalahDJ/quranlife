import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimesPageController extends GetxController {
  PageController timespagecontroller = PageController();

  RxInt currentPage = 0.obs;

  void pagecontroller() {
    //w made the page controller here on init state for lunching whene the page
    //open and we add a listener to it let it value change if we change the page
    //also we use the update for refreshing the ui if the value change
    timespagecontroller.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        currentPage.value = timespagecontroller.page!.toInt();
        update();
      });
    });
  }

  @override
  void onClose() {
    timespagecontroller.dispose();
    super.onClose();
  }
}
