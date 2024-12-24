import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';

class HijriCalender extends StatelessWidget {
  HijriCalender({super.key});

  final HijriCalendar hijri = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text("Hijri Calendar"),
      ),
      body: Stack(
        children: [
          //gradient background
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: Sizeconfig.screenheight! / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: Sizeconfig.screenwidth,
                      child: Text(
                        "${hijri.hDay} - ${hijri.shortMonthName} - ${hijri.hYear} Hijri",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? kmaincolor4
                              : Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                  Card(
                    elevation: 0.1,
                    color: Get.isDarkMode
                        ? kmaincolor2dark.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                    child: SizedBox(
                        height: Sizeconfig.screenheight! / 1.5,
                        child: IslamicHijriCalendar(
                          defaultBackColor: Colors.transparent,
                          isHijriView: true,
                          highlightBorder: Colors.white.withOpacity(0.8),
                          highlightTextColor:
                              Get.isDarkMode ? kmaincolor4 : kmaincolor,
                          defaultTextColor:
                              Get.isDarkMode ? Colors.white : Colors.black,
                          defaultBorder:
                              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
                          adjustmentValue: 0,
                          isDisablePreviousNextMonthDates: true,
                        )),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: Sizeconfig.screenwidth,
                      child: Text(
                        "Important Notes About Islamic Occasions",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                  noticeText(
                      "Islamic occasions do not occur in the same Gregorian months each year. They move forward by 11 days annually."),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                  noticeText(
                      "Ramadan occurs in different Gregorian months as it moves through all months of the year over time."),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                  noticeText(
                      "Do not associate any Islamic occasion with a specific Gregorian month."),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                  noticeText(
                      "Please follow your country's Religious Affairs Directory guidelines for accurate religious occasion dates."),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding noticeText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: Sizeconfig.screenwidth,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
