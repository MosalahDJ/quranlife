import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';

final FetchPrayerFromDate fpfctrl = Get.find();

class TimesPageController extends GetxController {
  PageController timespagecontroller = PageController();
  late RxInt currentPage = 0.obs;
  int currentday = 0;

  //this func maded for making date string as same as date in the url and make sure it's dynamic
  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  //this func maded for making date string as same as date returned by
  //formatDate func for cheking if it = to date and and show the left time in
  //the table of prayertimes just in the current date
  String formatDateString(String date) {
    List parts = date.split("-");
    return "${parts[0]}-${parts[1].toString().padLeft(2, '0')}-${parts[2].toString().padLeft(2, '0')}";
  }

  //i use this func for selecting currentpage with current day
  //I use it in splashviewController
  void getcurrentpage() {
    final dates = fpfctrl.prayersdayskeys;
    late int value = 0;
    for (int index = 0; index < dates.length; index++) {
      if (formatDateString(dates[index]) == formatDate(DateTime.now())) {
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
