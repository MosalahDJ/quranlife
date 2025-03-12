import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/times_page_controller.dart';

final DeterminePrayersController prayerctrl = Get.find();
final FCMController notictrl = Get.find();
final DeterminePrayersController dpcctrl = Get.find();
final TimesPageController timespagectrl = Get.find();

class SalawatTableRow {
  //rows of the table
  TableRow myrow({
    required String salatname,
    required String salattime,
    // required RxBool salatvolum,
    required String day,
  }) {
    return TableRow(
      children: [
        Obx(
          () => Text(
            salatname,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,

              //in this condition I check if salat time = current prayer then
              //I check if date "$i" in the list of keys == current date
              //I use these funcs for making sure it range as same as each other
              //and the only diffrent is in the date not on string range
              color:
                  salattime == prayerctrl.currentPrayer.value &&
                          timespagectrl.formatDateString(
                                fpfctrl.getDateByIndex(
                                  timespagectrl.currentPage.value,
                                )!,
                              ) ==
                              timespagectrl.formatDate(DateTime.now())
                      ? kmaincolor4
                      : Colors.white,
            ),
          ),
        ),
        Obx(
          () => Row(
            children: [
              Text(
                "    ${fpfctrl.prayersdays[day][salattime]}",
                style: TextStyle(
                  fontSize: 18,

                  //in this condition I check if salat time = current prayer then
                  //I check if date "$i" in the list of keys == current date
                  //I use these funcs for making sure it range as same as each other
                  //and the only diffrent is in the date not on string range
                  color:
                      salattime == prayerctrl.currentPrayer.value &&
                              timespagectrl.formatDateString(
                                    fpfctrl.getDateByIndex(
                                      timespagectrl.currentPage.value,
                                    )!,
                                  ) ==
                                  timespagectrl.formatDate(DateTime.now())
                          ? kmaincolor4
                          : Colors.white,
                ),
              ),
              Visibility(
                // first check if current prayer = isha it for make the "timer
                //until next" visible in next day not in currnt day
                visible:
                    prayerctrl.currentPrayer.value == "Isha"
                        //I use these funcs for making sure it range as same as each other
                        //and the only diffrent is in the date not on string range
                        //in this condition I chek if salat time = next prayer
                        ? (salattime == dpcctrl.nextPrayer.value &&
                            //then I check if date "$i" in the list of keys == next date
                            timespagectrl.formatDateString(
                                  fpfctrl.getDateByIndex(
                                    timespagectrl.currentPage.value,
                                  )!,
                                ) ==
                                timespagectrl.formatDate(
                                  DateTime.now().add(const Duration(days: 1)),
                                ))
                        : (salattime == dpcctrl.nextPrayer.value &&
                            //then I check if date "$i" in the list of keys == current date
                            timespagectrl.formatDateString(
                                  fpfctrl.getDateByIndex(
                                    timespagectrl.currentPage.value,
                                  )!,
                                ) ==
                                timespagectrl.formatDate(DateTime.now())),
                child: Text(
                  "    -${dpcctrl.timeUntilNext.value}",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        salattime == prayerctrl.currentPrayer.value
                            ? kmaincolor4
                            : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => IconButton(
            onPressed: () {
              Get.snackbar(
                "upcoming_feature_title".tr,
                "upcoming_feature_desc".tr,
                backgroundColor: Colors.transparent.withValues(alpha: 0.3),
                colorText: const Color(0xFFFFFFFF),
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                padding: const EdgeInsets.all(20),
              );
            },
            icon: Icon(
              // salatvolum.value ? Icons.volume_up : Icons.volume_off,
              Icons.volume_up,
              //in this condition I chek if salat time = current prayer then
              //I check if date "$i" in the list of keys == current date
              //I use these funcs for making sure it range as same as each other
              //and the only diffrent is in the date not on string range
              color:
                  salattime == prayerctrl.currentPrayer.value &&
                          timespagectrl.formatDateString(
                                fpfctrl.getDateByIndex(
                                  timespagectrl.currentPage.value,
                                )!,
                              ) ==
                              timespagectrl.formatDate(DateTime.now())
                      ? kmaincolor4
                      : Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  //space bettwen rows in table
  TableRow myspace() {
    return TableRow(
      children: [
        SizedBox(height: Sizeconfig.screenheight! / 70),
        SizedBox(height: Sizeconfig.screenheight! / 70),
        SizedBox(height: Sizeconfig.screenheight! / 70),
      ],
    );
  }

  List<TableRow> mytablerows(int i) {
    return [
      myrow(
        salatname: "fajr".tr,
        salattime: "Fajr",
        day:
            fpfctrl.getDateByIndex(i) != null
                ? fpfctrl.getDateByIndex(i)!
                : timespagectrl.formatDate(fpfctrl.currentDate),
      ),
      myspace(),
      myrow(
        salatname: "sunrise".tr,
        salattime: "Sunrise",
        day:
            fpfctrl.getDateByIndex(i) != null
                ? fpfctrl.getDateByIndex(i)!
                : timespagectrl.formatDate(fpfctrl.currentDate),
      ),
      myspace(),
      myrow(
        salatname: "dhuhr".tr,
        salattime: "Dhuhr",
        day:
            fpfctrl.getDateByIndex(i) != null
                ? fpfctrl.getDateByIndex(i)!
                : timespagectrl.formatDate(fpfctrl.currentDate),
      ),
      myspace(),
      myrow(
        salatname: "asr".tr,
        salattime: "Asr",
        day:
            fpfctrl.getDateByIndex(i) != null
                ? fpfctrl.getDateByIndex(i)!
                : timespagectrl.formatDate(fpfctrl.currentDate),
      ),
      myspace(),
      myrow(
        salatname: "maghrib".tr,
        salattime: "Maghrib",
        day:
            fpfctrl.getDateByIndex(i) != null
                ? fpfctrl.getDateByIndex(i)!
                : timespagectrl.formatDate(fpfctrl.currentDate),
      ),
      myspace(),
      myrow(
        salatname: "isha".tr,
        salattime: "Isha",
        day:
            fpfctrl.getDateByIndex(i) != null
                ? fpfctrl.getDateByIndex(i)!
                : timespagectrl.formatDate(fpfctrl.currentDate),
      ),
    ];
  }
}
