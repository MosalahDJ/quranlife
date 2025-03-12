import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';

class HijriCalender extends StatelessWidget {
  HijriCalender({super.key});

  final HijriCalendar hijri = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: ShimmerText(
          text: 'hijri_calendar'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          //gradient background
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: Sizeconfig.screenheight! / 100),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: Sizeconfig.screenwidth,
                        child: Text(
                          "${hijri.hDay} - ${hijri.shortMonthName} - ${hijri.hYear} Hijri",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color:
                                Get.isDarkMode
                                    ? kmaincolor4
                                    : Colors.white.withValues(alpha: 0.8),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Sizeconfig.screenheight! / 60),
                    Card(
                      elevation: 0.1,
                      color:
                          Get.isDarkMode
                              ? kmaincolor2dark.withValues(alpha: 0.5)
                              : Colors.white.withValues(alpha: 0.5),
                      child: SizedBox(
                        height: Sizeconfig.screenheight! / 1.5,
                        child: IslamicHijriCalendar(
                          defaultBackColor: Colors.transparent,
                          isHijriView: true,
                          highlightBorder: Colors.white.withValues(alpha: 0.8),
                          highlightTextColor:
                              Get.isDarkMode ? kmaincolor4 : kmaincolor,
                          defaultTextColor:
                              Get.isDarkMode ? Colors.white : Colors.black,
                          defaultBorder: Colors.white.withValues(alpha: 0.5),
                          adjustmentValue: 0,
                          isDisablePreviousNextMonthDates: true,
                        ),
                      ),
                    ),
                    SizedBox(height: Sizeconfig.screenheight! / 60),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: LayoutBuilder(
                        builder:
                            (context, constraints) => Container(
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).cardColor.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: kmaincolor.withValues(alpha: 0.08),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: Sizeconfig.screenheight! / 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: SizedBox(
                                      width: Sizeconfig.screenwidth,
                                      child: Text(
                                        'important_notes'.tr,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color:
                                              Get.isDarkMode
                                                  ? kmaincolor4
                                                  : kmaincolor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Duaa Content Container
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                      24,
                                      0,
                                      24,
                                      10,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: Sizeconfig.screenheight! / 50,
                                        ),
                                        noticeText('note_yearly_shift'.tr),
                                        SizedBox(
                                          height: Sizeconfig.screenheight! / 50,
                                        ),
                                        noticeText('note_ramadan'.tr),
                                        SizedBox(
                                          height: Sizeconfig.screenheight! / 50,
                                        ),
                                        noticeText('note_association'.tr),
                                        SizedBox(
                                          height: Sizeconfig.screenheight! / 50,
                                        ),
                                        noticeText('note_guidelines'.tr),
                                        SizedBox(
                                          height: Sizeconfig.screenheight! / 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
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
