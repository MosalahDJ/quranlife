import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:project/features/controller/spalshview%20controller/splash_view_controller.dart';

class Salwatpageview extends StatelessWidget {
  Salwatpageview({
    super.key,
    required this.salatname,
    required this.salattime,
    required this.icon,
  });
  final String salatname;
  final String salattime;
  final String icon;
  final SplashViewController initialctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();
  final DeterminePrayersController dpcctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    String day = timespagectrl.formatDate(DateTime.now());

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          timespagectrl.getcurrentpage();
          Get.toNamed("salattime");
        },
        child: Ink(
          child: Card(
            elevation: 2,
            //if salat time = curent prayer time use color else use other color
            color:
                fpfctrl.prayersdays[day]?[salattime]?.toString() ==
                        dpcctrl.currentPrayertime.value
                    ? Get.isDarkMode
                        ? kmaincolor3.withValues(alpha: 0.4)
                        : kmaincolor4.withValues(alpha: 0.7)
                    : Get.isDarkMode
                    ? kmaincolor2dark.withValues(alpha: 0.5)
                    : Colors.white.withValues(alpha: 0.7),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 200 / 2.25,
              width: Sizeconfig.screenwidth! / 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    salatname,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? textcolor3dark : textcolor1,
                      fontSize: Sizeconfig.screenheight! / 50,
                    ),
                  ),
                  Obx(
                    () =>
                        initialctrl.isLoading.value == true
                            ? SizedBox(
                              height: 200 / 7,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color:
                                      Get.isDarkMode
                                          ? kmaincolor3dark
                                          : kmaincolor,
                                  strokeAlign: -5,
                                  strokeWidth: 5,
                                ),
                              ),
                            )
                            : SizedBox(
                              height: 200 / 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    fpfctrl.prayersdays[day]?[salattime]
                                            ?.toString() ??
                                        "-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          Get.isDarkMode
                                              ? kmaincolor4
                                              : kmaincolor,
                                      fontSize: Sizeconfig.screenheight! / 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 27,
                    width: Sizeconfig.screenwidth! / 10,
                    child: Image.asset(
                      icon,
                      alignment: Alignment.center,
                      color: Get.isDarkMode ? textcolor3dark : textcolor1,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
