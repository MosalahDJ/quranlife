import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: kmaincolor,
        title: Text(
          'category'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),

          // Background image with blur
          ClipRect(
            child: Image.asset(
              "lib/core/assets/images/background_image/arch.jpg",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation<double>(0.2),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2,
              left: 8,
              right: 8,
              top: 2,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: Sizeconfig.screenwidth,
                    height: Sizeconfig.screenheight! / 80,
                  ),
                  GetBuilder<ThemeController>(
                      builder: (controller) => GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1,
                            children: [
                              mycategory(
                                () {},
                                MdiIcons.robot,
                                'ai_bot'.tr,
                              ),
                              mycategory(
                                () {},
                                Icons.people_alt_rounded,
                                'community'.tr,
                              ),
                              mycategory(
                                () {},
                                Icons.analytics_rounded,
                                'statistics'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.kowtow,
                                'teaching_prayer'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.wudhu,
                                'wudu_ghusl'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.qibla,
                                'qibla_direction'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.tasbihHand,
                                'electronic_tasbih'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.community,
                                'friday_sunnahs'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.quran,
                                'al-arba\'in_nawawiyyah'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.kaaba,
                                'hajj_umrah'.tr,
                              ),
                              mycategory(
                                () {},
                                Icons.volunteer_activism_rounded,
                                'al-Hamd'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.prayingPerson,
                                'istighfar'.tr,
                              ),
                              mycategory(
                                () {},
                                FontAwesomeIcons.bookQuran,
                                'islamic_ruqyah'.tr,
                              ),
                              mycategory(
                                () {},
                                Icons.favorite_rounded,
                                'quranic_supplications'.tr,
                              ),
                              mycategory(
                                () {},
                                MdiIcons.accountVoice,
                                'prophets_supplications'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.calendar,
                                'islamic_calendar'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.allah99,
                                'asma_ul-husna'.tr,
                              ),
                              mycategory(
                                () {},
                                FlutterIslamicIcons.solidZakat,
                                'zakat'.tr,
                              ),
                            ],
                          )),
                  SizedBox(
                    width: Sizeconfig.screenwidth,
                    height: Sizeconfig.screenheight! / 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget mycategory(
  VoidCallback ontap,
  IconData categoryicon,
  String iconname,
) {
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
            color: Get.isDarkMode
                ? kmaincolor2dark.withOpacity(0.85)
                : Colors.white.withOpacity(0.9),
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
