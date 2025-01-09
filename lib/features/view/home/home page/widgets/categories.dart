import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                () {}, MdiIcons.robot, 'ai_bot'.tr, categorytitlecolor),
            categoryTitle(() {}, Icons.people_alt_rounded, 'community'.tr,
                categorytitlecolor),
            categoryTitle(() {}, Icons.analytics_rounded, 'statistics'.tr,
                categorytitlecolor),
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
              mycategory(() {}, FlutterIslamicIcons.kowtow,
                  'teaching_prayer'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.wudhu, 'wudu_ghusl'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.qibla, 'qibla_direction'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.tasbihHand,
                  'electronic_tasbih'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.community,
                  'friday_sunnahs'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.quran,
                  'al-arba\'in_nawawiyyah'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.kaaba, 'hajj_umrah'.tr,
                  categorycolor),
              mycategory(() {}, Icons.volunteer_activism_rounded, 'al-Hamd'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.prayingPerson,
                  'istighfar'.tr, categorycolor),
              mycategory(() {}, FontAwesomeIcons.bookQuran, 'islamic_ruqyah'.tr,
                  categorycolor),
              mycategory(() {}, Icons.favorite_rounded,
                  'quranic_supplications'.tr, categorycolor),
              mycategory(() {}, MdiIcons.accountVoice,
                  'prophets_supplications'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.calendar,
                  'islamic_calendar'.tr, categorycolor),
              mycategory(() {}, FlutterIslamicIcons.allah99, 'asma_ul-husna'.tr,
                  categorycolor),
              mycategory(() {}, FlutterIslamicIcons.solidZakat, 'zakat'.tr,
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
