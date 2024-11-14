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
        centerTitle: true,
        title: const Text("hijri calender"),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: Sizeconfig.screenheight! / 50,
                  ),
                  Text(
                    "${hijri.hDay} - ${hijri.shortMonthName} - ${hijri.hYear}  hijri",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 30,
                  ),
                  Card(
                    elevation: 10,
                    color: Get.isDarkMode
                        ? kmaincolor2dark.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                    child: SizedBox(
                        height: Sizeconfig.screenheight! / 1.5,
                        child: IslamicHijriCalendar(
                          getSelectedHijriDate: (selectedDate) {},
                          defaultBackColor: Colors.transparent,
                          isHijriView: true,
                          highlightBorder: Colors.white.withOpacity(0.8),
                          highlightTextColor: kmaincolor4,
                          defaultTextColor: Colors.white,
                          defaultBorder: kmaincolor3dark,
                          adjustmentValue: 0,
                          isDisablePreviousNextMonthDates: true,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
