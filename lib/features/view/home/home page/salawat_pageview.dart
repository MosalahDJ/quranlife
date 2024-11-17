import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/currunet_pray_time.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/salwatpageview.dart';

class SalawatPageview extends StatelessWidget {
  SalawatPageview({super.key});
  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenheight! < 768
          ? Sizeconfig.screenheight! / 2.7
          : Sizeconfig.screenheight! > 1010
              ? Sizeconfig.screenheight! / 4.3
              : Sizeconfig.screenheight! / 3.5,
      child: PageView(controller: homectrl.homepagecontroller, children: [
        //salat time
        Material(
          color: Colors.transparent,
          child: InkWell(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {
              Get.toNamed("salattime");
            },
            child: Ink(
              child: CurrentPrayTime(
                textcolor2: Get.isDarkMode ? Colors.white : Colors.black,
                textcolor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                elevation: 2,
                color: Get.isDarkMode
                    ? kmaincolor2dark.withOpacity(0.5)
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),

        //Salawattime
        Column(
          children: [
            SizedBox(
              height: (Sizeconfig.screenheight! < 768
                      ? Sizeconfig.screenheight! / 2.7
                      : Sizeconfig.screenheight! > 1010
                          ? Sizeconfig.screenheight! / 4.3
                          : Sizeconfig.screenheight! / 3.5) -
                  200,
              child: Column(
                children: [
                  SizedBox(
                    height: Sizeconfig.screenheight! / 120,
                  ),
                  SizedBox(
                      width: Sizeconfig.screenwidth,
                      child: Text("Mawaqit",
                          style: Theme.of(context).textTheme.titleLarge)),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: InkWell(
                onTap: () => Get.toNamed("salattime"),
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Ink(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Salwatpageview(
                              icon:
                                  "lib/core/assets/images/salat_icons/fajr.png",
                              salatname: "fajr",
                              salattime: "Fajr",
                            ),
                            Salwatpageview(
                              icon:
                                  "lib/core/assets/images/salat_icons/fajr.png",
                              salatname: "Sunrise",
                              salattime: "Sunrise",
                            ),
                            Salwatpageview(
                              icon:
                                  "lib/core/assets/images/salat_icons/duhr.png",
                              salatname: "Dhuhr",
                              salattime: "Dhuhr",
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Salwatpageview(
                              icon:
                                  "lib/core/assets/images/salat_icons/ASR.png",
                              salatname: "Asr",
                              salattime: "Asr",
                            ),
                            Salwatpageview(
                              icon:
                                  "lib/core/assets/images/salat_icons/MAGHRIB.png",
                              salatname: "Maghrib",
                              salattime: "Maghrib",
                            ),
                            Salwatpageview(
                              icon:
                                  "lib/core/assets/images/salat_icons/ISHA.png",
                              salatname: "Isha",
                              salattime: "Isha",
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
