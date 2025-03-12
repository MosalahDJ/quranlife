import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:project/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:project/features/view/home/salat%20time/widgets/tablerow.dart';

class Prayertimestable extends GetView<DeterminePrayersController> {
  Prayertimestable({super.key});
  final DeterminePrayersController prayerctrl = Get.find();
  final FCMController notictrl = Get.find();
  final DeterminePrayersController dpcctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();
  final SalawatTableRow tablerowctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: Text(
            "prayer_board".tr,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        SizedBox(height: Sizeconfig.screenheight! / 100),
        //inside of box
        Card(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.4)),
              ],
            ),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              //date and table iside this get builder
              child: GetBuilder<TimesPageController>(
                builder:
                    (c) => Column(
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
                                            timespagectrl.currentPage.value,
                                          ) ==
                                          null
                                      ? "-"
                                      : fpfctrl.getDateByIndex(
                                        timespagectrl.currentPage.value,
                                      )!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Sizeconfig.screenwidth! / 2.6,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //return to past page
                                    IconButton(
                                      iconSize: 20,
                                      onPressed: () {
                                        timespagectrl.currentPage.value ==
                                                    timespagectrl.currentday +
                                                        1 ||
                                                timespagectrl
                                                        .currentPage
                                                        .value ==
                                                    timespagectrl.currentday
                                            ? timespagectrl.timespagecontroller
                                                .jumpToPage(
                                                  timespagectrl
                                                          .currentPage
                                                          .value -
                                                      1,
                                                )
                                            : timespagectrl.timespagecontroller
                                                .animateToPage(
                                                  timespagectrl
                                                          .currentPage
                                                          .value -
                                                      1,
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                  curve: Curves.bounceIn,
                                                );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios_new_sharp,
                                      ),
                                    ),
                                    //return to first page
                                    IconButton(
                                      iconSize: 30,
                                      onPressed: () {
                                        timespagectrl.timespagecontroller
                                            .jumpToPage(
                                              timespagectrl.currentday,
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.keyboard_double_arrow_down,
                                      ),
                                    ),
                                    //going to next page
                                    IconButton(
                                      iconSize: 20,
                                      onPressed: () {
                                        timespagectrl.currentPage.value ==
                                                    timespagectrl.currentday -
                                                        1 ||
                                                timespagectrl
                                                        .currentPage
                                                        .value ==
                                                    timespagectrl.currentday
                                            ? timespagectrl.timespagecontroller
                                                .jumpToPage(
                                                  timespagectrl
                                                          .currentPage
                                                          .value +
                                                      1,
                                                )
                                            : timespagectrl.timespagecontroller
                                                .animateToPage(
                                                  timespagectrl
                                                          .currentPage
                                                          .value +
                                                      1,
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                  curve: Curves.bounceIn,
                                                );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              Sizeconfig.screenheight! < 768
                                  ? Sizeconfig.screenheight! / 2
                                  : Sizeconfig.screenheight! > 1010
                                  ? Sizeconfig.screenheight! / 2.90
                                  : Sizeconfig.screenheight! / 2.45,
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: timespagectrl.timespagecontroller,
                            itemCount: fpfctrl.prayersdayskeys.length,
                            itemBuilder:
                                (context, i) => Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  columnWidths: const {
                                    0: FlexColumnWidth(
                                      1,
                                    ), // Column of prayer name
                                    1: FlexColumnWidth(
                                      2,
                                    ), // Column of prayer time
                                    2: FlexColumnWidth(
                                      1,
                                    ), // Column of prayer sound
                                  },
                                  children: tablerowctrl.mytablerows(i),
                                ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
