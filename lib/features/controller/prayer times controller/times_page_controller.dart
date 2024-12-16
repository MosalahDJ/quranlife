import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';

class TimesPageController extends GetxController {
  PageController timespagecontroller = PageController();
  RxInt currentPage = 0.obs;

  @override
  onInit() {
    super.onInit();
    final FetchPrayerFromDate fpfctrl = Get.find();

    RxInt getcurrentpage() {
      for (int i = 0; i < fpfctrl.prayersdayskeys.length; i++) {
        if (fpfctrl.prayersdayskeys[i] == fpfctrl.currentDate) {
          return i.obs; // Return the index as an observable
        }
      }
      return 0.obs; // Return 0 if no match is found
    }

    currentPage = getcurrentpage();

    pagecontroller();
  }

  void pagecontroller() {
    timespagecontroller.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (timespagecontroller.page != null) {
          currentPage.value = timespagecontroller.page!.toInt(); // Ensure currentPage is updated correctly
        }
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
