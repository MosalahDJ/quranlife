import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';

final FetchPrayerFromDate fpfctrl = Get.find();

class TimesPageController extends GetxController {
  PageController timespagecontroller = PageController();
  late RxInt currentPage = 0.obs;
  int currentday = 0;

  void getcurrentpage() {
    final dates = fpfctrl.prayersdayskeys;
    late int value = 0;
    for (int index = 0; index < dates.length; index++) {
      if (fpfctrl.formatDateString(dates[index]) ==
          fpfctrl.formatDate(DateTime.now())) {
        value = index;
        currentday = value;
        currentPage = value.obs;
      } else {
        continue;
      }
    }
  }

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
