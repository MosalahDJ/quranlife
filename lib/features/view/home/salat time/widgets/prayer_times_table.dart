import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/fcm%20controllers/adhan_noti_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/times_page_controller.dart';

class Prayertimestable extends GetView<DeterminePrayersController> {
  Prayertimestable({
    super.key,
  });
  final DeterminePrayersController prayerctrl = Get.find();
  final FCMController notictrl = Get.find();
  final AdhanNotiController adhanctrl = Get.find();
  final DeterminePrayersController dpcctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();

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
                        fpfctrl.formatDateString(fpfctrl.getDateByIndex(
                                timespagectrl.currentPage.value)!) ==
                            fpfctrl.formatDate(DateTime.now())
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

                      //in this condition I chek if salat time = current prayer then
                      //I check if date "$i" in the list of keys == current date
                      //I use these funcs for making sure it range as same as each other
                      //and the only diffrent is in the date not on string range
                      color: salattime == prayerctrl.currentPrayer.value &&
                              fpfctrl.formatDateString(fpfctrl.getDateByIndex(
                                      timespagectrl.currentPage.value)!) ==
                                  fpfctrl.formatDate(DateTime.now())
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
                          fpfctrl.formatDateString(fpfctrl.getDateByIndex(
                                  timespagectrl.currentPage.value)!) ==
                              fpfctrl.formatDate(
                                DateTime.now().add(
                                  const Duration(days: 1),
                                ),
                              ))
                      : (salattime == dpcctrl.nextPrayer.value &&
                          //then I check if date "$i" in the list of keys == current date
                          fpfctrl.formatDateString(fpfctrl.getDateByIndex(
                                  timespagectrl.currentPage.value)!) ==
                              fpfctrl.formatDate(
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
                        fpfctrl.formatDateString(fpfctrl.getDateByIndex(
                                timespagectrl.currentPage.value)!) ==
                            fpfctrl.formatDate(DateTime.now())
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Card(
            elevation: 0,
            color: Colors.transparent,
            child: Text(
              "Prayer  Board",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
        SizedBox(
          height: Sizeconfig.screenheight! / 100,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4))]),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: GetBuilder<TimesPageController>(
              builder: (c) => Column(
                children: [
                  SizedBox(
                    width: Sizeconfig.screenwidth! / 1.1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            fpfctrl.getDateByIndex(
                                        timespagectrl.currentPage.value) ==
                                    null
                                ? "-"
                                : fpfctrl.getDateByIndex(
                                    timespagectrl.currentPage.value)!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Sizeconfig.screenwidth! / 3.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //return to past page
                              IconButton(
                                  iconSize: 20,
                                  onPressed: () {
                                    timespagectrl.currentPage.value == 1
                                        ? timespagectrl.timespagecontroller
                                            .jumpToPage(
                                            timespagectrl.currentPage.value - 1,
                                          )
                                        : timespagectrl.timespagecontroller
                                            .animateToPage(
                                            timespagectrl.currentPage.value - 1,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.bounceIn,
                                          );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_sharp,
                                  )),
                              //going to next page
                              IconButton(
                                  iconSize: 20,
                                  onPressed: () {
                                    timespagectrl.currentPage.value == 0
                                        ? timespagectrl.timespagecontroller
                                            .jumpToPage(
                                            timespagectrl.currentPage.value + 1,
                                          )
                                        : timespagectrl.timespagecontroller
                                            .animateToPage(
                                            timespagectrl.currentPage.value + 1,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.bounceIn,
                                          );
                                  },
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_sharp)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! < 768
                        ? Sizeconfig.screenheight! / 2
                        : Sizeconfig.screenheight! > 1010
                            ? Sizeconfig.screenheight! / 2.90
                            : Sizeconfig.screenheight! / 2.45,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: timespagectrl.timespagecontroller,
                      itemCount: fpfctrl.prayersdayskeys.length,
                      itemBuilder: (context, i) => Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(1), // Column of prayer name
                          1: FlexColumnWidth(2), // Column of prayer time
                          2: FlexColumnWidth(1), // Column of prayer sound
                        },
                        children: mytablerows(i),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<TableRow> mytablerows(int i) {
    return [
      myrow(
          "الفجر",
          "Fajr",
          adhanctrl.fajrvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : fpfctrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "الشروق",
          "Sunrise",
          adhanctrl.sunrizevolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : fpfctrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "الظهر",
          "Dhuhr",
          adhanctrl.duhrvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : fpfctrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "العصر",
          "Asr",
          adhanctrl.asrvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : fpfctrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "المغرب",
          "Maghrib",
          adhanctrl.maghribvolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : fpfctrl.formatDate(fpfctrl.currentDate)),
      myspace(),
      myrow(
          "العشاء",
          "Isha",
          adhanctrl.ishavolum,
          fpfctrl.getDateByIndex(i) != null
              ? fpfctrl.getDateByIndex(i)!
              : fpfctrl.formatDate(fpfctrl.currentDate)),
    ];
  }
}
