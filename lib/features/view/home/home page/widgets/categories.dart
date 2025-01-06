import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class ServiceCategorie extends StatelessWidget {
  const ServiceCategorie(
      {super.key,
      required this.categorycolor,
      required this.categorytitlecolor});
  final Color categorycolor;
  final Color categorytitlecolor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        tilePadding: const EdgeInsets.all(0),
        childrenPadding: const EdgeInsets.all(0),
        controlAffinity: ListTileControlAffinity.trailing,
        expansionAnimationStyle: AnimationStyle(
            curve: const FlippedCurve(Curves.slowMiddle),
            duration: const Duration(milliseconds: 500)),
        title: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
          children: [
            categoryTitle(
                () {}, Icons.menu_book, 'quran_wird'.tr, categorytitlecolor),
            categoryTitle(() {}, Icons.record_voice_over, 'hadith_wird'.tr,
                categorytitlecolor),
            categoryTitle(
                () {}, Icons.explore, 'allah_names'.tr, categorytitlecolor),
          ],
        ),
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            children: [
              mycategory(() {}, FlutterIslamicIcons.allah, 'quran_wird'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.hadji, 'prayer_times'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.calendar,
                  'islamic_occasions'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.family, 'community'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.allah, 'learn_islam'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.hadji, 'prayer_info'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.calendar,
                  'qibla_direction'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.community,
                  'mosque_finder'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.allah, 'daily_wird'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.hadji, 'hadith_wird'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.calendar,
                  'islamic_calendar'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.community, 'allah_names'.tr,
                  categorycolor),
            ],
          ),
        ],
      ),
    );
  }
}

Widget mycategory(VoidCallback ontap, IconData categoryicon, String iconname,
    Color categorycolor) {
  return Material(
    elevation: 2,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: ontap,
      child: GetBuilder<MyHomeController>(
        builder: (_) => Container(
          decoration: BoxDecoration(
            color: categorycolor,
            borderRadius: BorderRadius.circular(12),
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
  );
}

Widget categoryTitle(
    VoidCallback ontap, IconData icon, String title, Color categorytitlecolor) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(12),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: ontap,
      child: GetBuilder<MyHomeController>(
        builder: (_) => Container(
          decoration: BoxDecoration(
            color: categorytitlecolor,
            borderRadius: BorderRadius.circular(12),
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
                  icon,
                  size: 28,
                  color: Get.isDarkMode ? textcolor3dark : textcolor1,
                ),
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
