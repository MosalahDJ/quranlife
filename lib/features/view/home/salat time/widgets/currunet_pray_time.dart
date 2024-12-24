import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:quranlife/features/controller/spalshview%20controller/splash_view_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CurrentPrayTime extends StatelessWidget {
  CurrentPrayTime(
      {super.key,
      required this.color,
      required this.elevation,
      required this.textcolor,
      required this.textcolor2,
      required this.mawaqitTextColor});

  final Color color;
  final Color textcolor;
  final Color textcolor2;
  final Color mawaqitTextColor;
  final double elevation;
  final DeterminePrayersController prayerctrl = Get.find();
  final LocationController locationctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();
  final SplashViewController initialctrl = Get.find();
  final GetResponseBody grbctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //making stack widget responsive
      height: Sizeconfig.screenheight! < 768
          ? Sizeconfig.screenheight! / 3
          : Sizeconfig.screenheight! > 1010
              ? Sizeconfig.screenheight! / 4
              : Sizeconfig.screenheight! / 3.5,
      child: Stack(
        children: [
          //date text
          Positioned(
            top: 0,
            left: 0,
            child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Text(
                  "Mawaqite",
                  style: TextStyle(color: mawaqitTextColor, fontSize: 22),
                )),
          ),
          //card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 200,
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
                        child: initialctrl.isLoading.value == true
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Get.isDarkMode
                                    ? kmaincolor3dark
                                    : kmaincolor,
                              ))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Next Prayer: ",
                                        style: TextStyle(
                                          color: textcolor2,
                                          fontSize: 17,
                                        ),
                                      ),
                                      //next salat
                                      Text(
                                        prayerctrl.nextPrayer.value,
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
                                        "Time Remaining: ",
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
          //get position button
          Positioned(
              bottom: Sizeconfig.screenheight! < 768
                  ? Sizeconfig.screenheight! / 50
                  : Sizeconfig.screenheight! > 1010
                      ? Sizeconfig.screenheight! / 200
                      : Sizeconfig.screenheight! / 100,
              right: Sizeconfig.screenwidth! / 40,
              child: Card(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      title: "Get New Data",
                      desc:
                          "Get current location and request new data from the server.\nThis may take a few minutes.",
                      btnOkOnPress: () async {
                        initialctrl.isLoading(true);
                        await locationctrl.determinePosition();
                        await grbctrl.demendeNewResponse();
                        await fpfctrl.fetchPrayerTimes();
                        prayerctrl.determineCurrentPrayer();
                        timespagectrl.pagecontroller();
                        prayerctrl.currentPrayer.value == "-"
                            ? Get.snackbar("Conection field",
                                "please check your internet conection then retry")
                            : null;
                        initialctrl.isLoading(false);
                      },
                      btnCancelOnPress: () {},
                      btnCancelText: "Cancel",
                      btnOkText: "OK",
                    ).show();
                  },
                  child: SizedBox(
                    height: Sizeconfig.screenheight! < 768
                        ? Sizeconfig.screenheight! / 11
                        : Sizeconfig.screenheight! > 1010
                            ? Sizeconfig.screenheight! / 30
                            : Sizeconfig.screenheight! / 20,
                    width: Sizeconfig.screenwidth! / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: Sizeconfig.screenheight! < 768
                                ? Sizeconfig.screenheight! / 11
                                : Sizeconfig.screenheight! > 1010
                                    ? Sizeconfig.screenheight! / 30
                                    : Sizeconfig.screenheight! / 20,
                            width: Sizeconfig.screenwidth! / 3.5,
                            child: initialctrl.isLoading.value == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Get.isDarkMode
                                        ? kmaincolor3dark
                                        : kmaincolor,
                                    strokeAlign: -5,
                                  ))
                                : Center(
                                    child: GetBuilder<LocationController>(
                                      builder: (c) => Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        "${locationctrl.location},${locationctrl.sublocation}",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
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
              )),
          //masjid png image
          Positioned(
            right: Sizeconfig.screenwidth! / 50,
            left: Sizeconfig.screenwidth! / 2.1,
            bottom: Sizeconfig.screenheight! < 768
                ? Sizeconfig.screenheight! / 9
                : Sizeconfig.screenheight! > 1010
                    ? Sizeconfig.screenheight! / 25
                    : Sizeconfig.screenheight! / 17,
            child: Image.asset(
              "lib/core/assets/images/homeimages/masjid3d.png",
              height: Sizeconfig.screenheight! / 4,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
