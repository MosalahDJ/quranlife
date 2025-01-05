import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/currunet_pray_time.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/salwatpageview.dart';

class SalawatPageview extends StatelessWidget {
  SalawatPageview({super.key});
  final MyHomeController homectrl = Get.find();
  final HijriCalendar hijri = HijriCalendar.now();
  final TimesPageController timespagectrl = Get.find();
  final LanguageController langctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenheight! < 768
          ? Sizeconfig.screenheight! / 2.7
          : Sizeconfig.screenheight! > 1010
              ? Sizeconfig.screenheight! / 4.3
              : Sizeconfig.screenheight! / 3.4,
      child: PageView(controller: homectrl.homepagecontroller, children: [
        //salat time
        CurrentPrayTime(
          moreIconVisibility: true,
          onpressed: () {},
          textcolor2: Get.isDarkMode ? Colors.white : Colors.black,
          textcolor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          elevation: 2,
          color: Get.isDarkMode
              ? kmaincolor2dark.withOpacity(0.5)
              : Colors.white.withOpacity(0.7),
        ),

        //Salawattime
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  ${hijri.hDay} - ${'hijri_month_${hijri.longMonthName}'.tr} - ${hijri.hYear}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 200,
              child: Ink(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Salwatpageview(
                            icon: "lib/core/assets/images/salat_icons/fajr.png",
                            salatname: "fajr".tr,
                            salattime: "Fajr",
                          ),
                          Salwatpageview(
                            icon: "lib/core/assets/images/salat_icons/fajr.png",
                            salatname: "sunrise".tr,
                            salattime: "Sunrise",
                          ),
                          Salwatpageview(
                            icon: "lib/core/assets/images/salat_icons/duhr.png",
                            salatname: "dhuhr".tr,
                            salattime: "Dhuhr",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Salwatpageview(
                            icon: "lib/core/assets/images/salat_icons/ASR.png",
                            salatname: "asr".tr,
                            salattime: "Asr",
                          ),
                          Salwatpageview(
                            icon:
                                "lib/core/assets/images/salat_icons/MAGHRIB.png",
                            salatname: "maghrib".tr,
                            salattime: "Maghrib",
                          ),
                          Salwatpageview(
                            icon: "lib/core/assets/images/salat_icons/ISHA.png",
                            salatname: "isha".tr,
                            salattime: "Isha",
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
