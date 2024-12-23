import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/spalshview%20controller/splash_view_controller.dart';

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
  final FetchPrayerFromDate fpfctrl = Get.find();
  final SplashViewController initialctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    String day = fpfctrl.formatDate(DateTime.now());

    return Card(
      elevation: 2,
      color: Get.isDarkMode
          ? kmaincolor2dark.withOpacity(0.5)
          : Colors.white.withOpacity(0.5),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 200 / 2.25,
        width: Sizeconfig.screenwidth! / 3.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              salatname,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Get.isDarkMode ? textcolor3dark : textcolor,
                  fontSize: Sizeconfig.screenheight! / 50),
            ),
            Obx(() => initialctrl.isLoading.value == true
                ? SizedBox(
                    height: 200 / 7,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Get.isDarkMode ? kmaincolor3dark : kmaincolor,
                      strokeAlign: -5,
                      strokeWidth: 5,
                    )),
                  )
                : SizedBox(
                    height: 200 / 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          fpfctrl.prayersdays[day]?[salattime]?.toString() ??
                              "-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                              fontSize: Sizeconfig.screenheight! / 50),
                        ),
                      ],
                    ),
                  )),
            SizedBox(
                height: Sizeconfig.screenheight! / 27,
                width: Sizeconfig.screenwidth! / 10,
                child: Image.asset(
                  icon,
                  alignment: Alignment.center,
                  color: Get.isDarkMode ? textcolor3dark : textcolor,
                  fit: BoxFit.fill,
                ))
          ],
        ),
      ),
    );
  }
}
