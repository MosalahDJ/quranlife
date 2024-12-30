import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
// import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/times_page_controller.dart';

final DeterminePrayersController prayerctrl = Get.find();
final FCMController notictrl = Get.find();
final AdhanNotiController adhanctrl = Get.find();
final DeterminePrayersController dpcctrl = Get.find();
// final FetchPrayerFromDate fpfctrl = Get.find();
final TimesPageController timespagectrl = Get.find();

class SalawatTableRow {
  //rows of the table
  TableRow myrow(
      String salatname, String salattime, RxBool salatvolum, String day) {
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
                color: salattime == prayerctrl.currentPrayer.value &&
                        timespagectrl.formatDateString(fpfctrl.getDateByIndex(
                                timespagectrl.currentPage.value)!) ==
                            timespagectrl.formatDate(DateTime.now())
                    ? kmaincolor4
                    : Colors.white),
          ),
        ),
        Obx(() => Row(
              children: [
                Text(
                  fpfctrl.prayersdays[day][salattime] ?? "-",
                  style: TextStyle(
                      fontSize: 18,

                      //in this condition I check if salat time = current prayer then
                      //I check if date "$i" in the list of keys == current date
                      //I use these funcs for making sure it range as same as each other
                      //and the only diffrent is in the date not on string range
                      color: salattime == prayerctrl.currentPrayer.value &&
                              timespagectrl.formatDateString(
                                      fpfctrl.getDateByIndex(
                                          timespagectrl.currentPage.value)!) ==
                                  timespagectrl.formatDate(DateTime.now())
                          ? kmaincolor4
                          : Colors.white),
                ),
                Visibility(
                  // first check if current prayer = isha it for make the "timer
                  //until next" visible in next day not in currnt day
                  visible: prayerctrl.currentPrayer.value == "Isha"

                      //I use these funcs for making sure it range as same as each other
                      //and the only diffrent is in the date not on string range

                      //in this condition I chek if salat time = next prayer
                      ? (salattime == dpcctrl.nextPrayer.value &&
                          //then I check if date "$i" in the list of keys == next date
                          timespagectrl.formatDateString(fpfctrl.getDateByIndex(
                                  timespagectrl.currentPage.value)!) ==
                              timespagectrl.formatDate(
                                DateTime.now().add(
                                  const Duration(days: 1),
                                ),
                              ))
                      : (salattime == dpcctrl.nextPrayer.value &&
                          //then I check if date "$i" in the list of keys == current date
                          timespagectrl.formatDateString(fpfctrl.getDateByIndex(
                                  timespagectrl.currentPage.value)!) ==
                              timespagectrl.formatDate(
                                DateTime.now(),
                              )),
                  child: Text(
                    "           -${dpcctrl.timeUntilNext.value}",
                    style: TextStyle(
                        fontSize: 16,
                        color: salattime == prayerctrl.currentPrayer.value
                            ? kmaincolor4
                            : Colors.white),
                  ),
                ),
              ],
            )),
        Obx(
          () => IconButton(
              onPressed: () {
                adhanctrl.volumfunc(salatvolum);
                // ignore: avoid_print
              },
              icon: Icon(
                salatvolum.value ? Icons.volume_up : Icons.volume_off,

                //in this condition I chek if salat time = current prayer then
                //I check if date "$i" in the list of keys == current date
                //I use these funcs for making sure it range as same as each other
                //and the only diffrent is in the date not on string range
                color: salattime == prayerctrl.currentPrayer.value &&
                        timespagectrl.formatDateString(fpfctrl.getDateByIndex(
                                timespagectrl.currentPage.value)!) ==
                            timespagectrl.formatDate(DateTime.now())
                    ? kmaincolor4
                    : Colors.white,
              )),
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
          "fajr".tr,
          "Fajr",
          adhanctrl.fajrvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : timespagectrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "sunrise".tr,
          "Sunrise",
          adhanctrl.sunrizevolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : timespagectrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "dhuhr".tr,
          "Dhuhr",
          adhanctrl.duhrvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : timespagectrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "asr".tr,
          "Asr",
          adhanctrl.asrvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : timespagectrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "maghrib".tr,
          "Maghrib",
          adhanctrl.maghribvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : timespagectrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "isha".tr,
          "Isha",
          adhanctrl.ishavolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : timespagectrl.formatDate(fpfctrl.currentDate)),
    ];
  }
}
