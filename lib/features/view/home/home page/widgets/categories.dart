import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class ServiceCategorie extends StatelessWidget {
  const ServiceCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Get.isDarkMode
          ? kmaincolor2dark.withOpacity(0.7)
          : Colors.white.withOpacity(0.7),
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        tilePadding: const EdgeInsets.all(0),
        childrenPadding: const EdgeInsets.all(0),
        controlAffinity: ListTileControlAffinity.trailing,
        expansionAnimationStyle: AnimationStyle(
            curve: const FlippedCurve(Curves.ease),
            duration: const Duration(milliseconds: 500)),
        title: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.2,
          children: [
            categoryTitle(() {}, Icons.menu_book, 'quran_wird'.tr),
            categoryTitle(() {}, Icons.record_voice_over, 'hadith_wird'.tr),
            categoryTitle(() {}, Icons.explore, 'allah_names'.tr),
          ],
        ),
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
            children: [
              mycategory(() {}, FlutterIslamicIcons.allah, 'quran_wird'.tr),
              mycategory(() {}, FlutterIslamicIcons.hadji, 'prayer_times'.tr),
              mycategory(
                  () {}, FlutterIslamicIcons.calendar, 'islamic_occasions'.tr),
              mycategory(() {}, FlutterIslamicIcons.family, 'community'.tr),
              mycategory(() {}, FlutterIslamicIcons.allah, 'learn_islam'.tr),
              mycategory(() {}, FlutterIslamicIcons.hadji, 'prayer_info'.tr),
              mycategory(
                  () {}, FlutterIslamicIcons.calendar, 'qibla_direction'.tr),
              mycategory(
                  () {}, FlutterIslamicIcons.community, 'mosque_finder'.tr),
              mycategory(() {}, FlutterIslamicIcons.allah, 'daily_wird'.tr),
              mycategory(() {}, FlutterIslamicIcons.hadji, 'hadith_wird'.tr),
              mycategory(
                  () {}, FlutterIslamicIcons.calendar, 'islamic_calendar'.tr),
              mycategory(
                  () {}, FlutterIslamicIcons.community, 'allah_names'.tr),
            ],
          ),
        ],
      ),
    );
  }
}

Widget mycategory(VoidCallback ontap, IconData categoryicon, String iconname) {
  return Material(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    color: Colors.transparent,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: ontap,
        child: GetBuilder<MyHomeController>(
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? kmaincolor2dark.withOpacity(0.2)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Get.isDarkMode
                      ? Colors.black12
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? kmaincolor2dark.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    categoryicon,
                    size: 28,
                    color: Get.isDarkMode ? textcolor3dark : textcolor1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  iconname,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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

Widget categoryTitle(ontap, icon, title) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: ontap,
      child: GetBuilder<MyHomeController>(
        builder: (_) => Container(
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? kmaincolor2dark.withOpacity(0.2)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode
                    ? Colors.black12
                    : Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: Get.isDarkMode ? textcolor3dark : textcolor1,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
