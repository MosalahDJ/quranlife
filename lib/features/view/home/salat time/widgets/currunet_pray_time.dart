import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/floating_animation_controllers/floating_animation_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:project/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:project/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/controller/spalshview%20controller/splash_view_controller.dart';

class CurrentPrayTime extends StatelessWidget {
  CurrentPrayTime({
    super.key,
    required this.color,
    required this.elevation,
    required this.textcolor,
    required this.textcolor2,
    required this.onpressed,
    required this.moreIconVisibility,
    required this.morebuttoncolor,
  });

  final Color color;
  final Color morebuttoncolor;
  final Color textcolor;
  final Color textcolor2;
  final double elevation;
  final bool moreIconVisibility;
  final VoidCallback onpressed;

  final DeterminePrayersController prayerctrl = Get.find();
  final LocationController locationctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();
  final SplashViewController initialctrl = Get.find();
  final GetResponseBody grbctrl = Get.find();
  final LanguageController langctrl = Get.find();
  final FloatingAnimationController fltanimtion = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //making stack widget responsive
      height:
          Sizeconfig.screenheight! < 768
              ? Sizeconfig.screenheight! / 2.5
              : Sizeconfig.screenheight! / 3.4,
      child: Stack(
        children: [
          //date text
          Positioned(
            top:
                Sizeconfig.screenheight! < 768
                    ? Sizeconfig.screenheight! / 30
                    : Sizeconfig.screenheight! / 70,
            left:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 1.6
                    : 0,
            right:
                langctrl.language.value == "ar"
                    ? 0
                    : Sizeconfig.screenwidth! / 1.6,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Text(
                "mawaqit".tr,
                style: TextStyle(color: morebuttoncolor, fontSize: 21),
              ),
            ),
          ),
          //card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                onTap: () {
                  timespagectrl.getcurrentpage();
                  Get.toNamed("salattime");
                },
                child: Ink(
                  child: Card(
                    elevation: elevation,
                    color: color,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Expanded(
                              flex: 1,
                              child:
                                  initialctrl.isLoading.value == true
                                      ? Center(
                                        child: CircularProgressIndicator(
                                          color:
                                              Get.isDarkMode
                                                  ? kmaincolor3dark
                                                  : kmaincolor,
                                        ),
                                      )
                                      : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "next_prayer".tr,
                                                style: TextStyle(
                                                  color: textcolor2,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              //next salat
                                              Text(
                                                prayerctrl.nextPrayer.value.tr,
                                                style: TextStyle(
                                                  color: textcolor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              //next salat time
                                              Text(
                                                prayerctrl.nextPrayerTime.value,
                                                style: TextStyle(
                                                  color: textcolor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "time_remaining".tr,
                                                style: TextStyle(
                                                  color: textcolor2,
                                                  fontSize: 17,
                                                ),
                                              ),

                                              //time untile next salat
                                              Text(
                                                prayerctrl.timeUntilNext.value,
                                                style: TextStyle(
                                                  color: textcolor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                            ),
                          ),
                          const Expanded(flex: 1, child: Column()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //get position button
          Positioned(
            bottom:
                Sizeconfig.screenheight! < 768
                    ? Sizeconfig.screenheight! / 50
                    : Sizeconfig.screenheight! / 100,
            right:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 2.4
                    : Sizeconfig.screenwidth! / 40,
            left:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 40
                    : Sizeconfig.screenwidth! / 2.4,
            child: Card(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    title: "get_new_data".tr,
                    desc: "get_location_desc".tr,
                    btnOkOnPress: () async {
                      initialctrl.isLoading(true);
                      await locationctrl.determinePosition();
                      await grbctrl.demendeNewResponse();
                      await fpfctrl.fetchPrayerTimes();
                      prayerctrl.determineCurrentPrayer();
                      timespagectrl.pagecontroller();
                      prayerctrl.currentPrayer.value == "-"
                          ? Get.snackbar(
                            "connection_failed".tr,
                            "check_internet".tr,
                          )
                          : null;
                      initialctrl.isLoading(false);
                    },
                    btnCancelOnPress: () {},
                    btnCancelText: "Cancel",
                    btnOkText: "OK",
                  ).show();
                },
                child: SizedBox(
                  height:
                      Sizeconfig.screenheight! < 768
                          ? Sizeconfig.screenheight! / 11
                          : Sizeconfig.screenheight! / 20,
                  width: Sizeconfig.screenwidth! / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height:
                              Sizeconfig.screenheight! < 768
                                  ? Sizeconfig.screenheight! / 11
                                  : Sizeconfig.screenheight! / 20,
                          width: Sizeconfig.screenwidth! / 3.5,
                          child:
                              initialctrl.isLoading.value == true
                                  ? Center(
                                    child: CircularProgressIndicator(
                                      color:
                                          Get.isDarkMode
                                              ? kmaincolor3dark
                                              : kmaincolor,
                                      strokeAlign: -5,
                                    ),
                                  )
                                  : Center(
                                    child: GetBuilder<LocationController>(
                                      builder:
                                          (c) => Padding(
                                            padding: EdgeInsets.only(
                                              right:
                                                  langctrl.language.value ==
                                                          "ar"
                                                      ? 10.0
                                                      : 0,
                                            ),
                                            child: Text(
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              "${locationctrl.location},${locationctrl.sublocation}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                    ),
                                  ),
                        ),
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //masjid png image
          Positioned(
            right:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 2.3
                    : Sizeconfig.screenwidth! / 50,
            left:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 50
                    : Sizeconfig.screenwidth! / 2.3,
            bottom:
                Sizeconfig.screenheight! < 768
                    ? Sizeconfig.screenheight! / 10
                    : Sizeconfig.screenheight! / 30,
            child: fltanimtion.buildFloatingWidget(
              shadowHeight: 30,
              shadowWidth:
                  langctrl.language.value == "ar"
                      ? (Sizeconfig.screenwidth! / 2.4) -
                          (Sizeconfig.screenwidth! / 50)
                      : (Sizeconfig.screenwidth! / 2.2) -
                          (Sizeconfig.screenwidth! / 50),
              shadowOffset: -30,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  overlayColor: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  onTap: () {
                    timespagectrl.getcurrentpage();
                    Get.toNamed("salattime");
                  },
                  child: Ink(
                    child: Image.asset(
                      "lib/core/assets/images/homeimages/masjid3d.png",
                      height: Sizeconfig.screenheight! / 4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //morebutton
          Positioned(
            top:
                Sizeconfig.screenheight! < 768
                    ? Sizeconfig.screenheight! / 50
                    : Sizeconfig.screenheight! / 180,
            left:
                langctrl.language.value == "ar"
                    ? 0
                    : Sizeconfig.screenwidth! / 1.26,
            right:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 1.26
                    : 0,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Visibility(
                visible: moreIconVisibility,
                child: IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: morebuttoncolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
