import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';
import 'package:project/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';
import 'package:project/features/view/home/categories/categories_pages/ai_bot_page.dart';
import 'package:project/features/view/home/categories/categories_pages/friday_sunnah.dart';
import 'package:project/features/view/home/categories/categories_pages/hadith/ahadith.dart';
import 'package:project/features/view/home/categories/categories_pages/haj%20and%20omra/haj_and_omra_page.dart';
import 'package:project/features/view/home/categories/categories_pages/islamicruqya.dart';
import 'package:project/features/view/home/categories/categories_pages/messaging_page.dart';
import 'package:project/features/view/home/categories/categories_pages/names%20of%20allah/allah_names.dart';
import 'package:project/features/view/home/categories/categories_pages/praise.dart';
import 'package:project/features/view/home/categories/categories_pages/prophets_supplication.dart';
import 'package:project/features/view/home/categories/categories_pages/qibla_direction.dart';
import 'package:project/features/view/home/categories/categories_pages/quranic_supplications.dart';
import 'package:project/features/view/home/categories/categories_pages/seeking_forgivnes.dart';
import 'package:project/features/view/home/categories/categories_pages/statistics_page.dart';
import 'package:project/features/view/home/categories/categories_pages/tasbih.dart';
import 'package:project/features/view/home/categories/categories_pages/teachingprayer.dart';
import 'package:project/features/view/home/categories/categories_pages/wudu%20and%20ghusl%20page/wudu_and_ghusle.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  final TimesPageController timespagectrl = Get.find();
  final FadeAnimationController fadectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: ShimmerText(
          text: 'category'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
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
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      width: Sizeconfig.screenwidth,
                      height: Sizeconfig.screenheight! / 80,
                    ),
                    GetBuilder<ThemeController>(
                      builder:
                          (controller) => FadeInUp(
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1,
                              children: [
                                mycategory(
                                  () {
                                    if (_isanonymous(context)) {
                                      return;
                                    }
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () =>
                                          AwesomeDialog(
                                            // ignore: use_build_context_synchronously
                                            context: context,
                                            dialogType: DialogType.info,
                                            title: 'welcome_message'.tr,
                                            desc: 'ai_disclaimer'.tr,
                                            btnOkText: 'ok'.tr,
                                            btnOkOnPress: () {},
                                          ).show(),
                                    );
                                    Get.to(() => const AiBotPage());
                                  },
                                  MdiIcons.robot,
                                  'ai_bot'.tr,
                                ),
                                mycategory(
                                  () {
                                    if (_isanonymous(context)) {
                                      return;
                                    }
                                    Get.to(() => const MessagingPage());
                                  },
                                  Icons.people_alt_rounded,
                                  'community'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const StatisticsPage());
                                  },
                                  Icons.analytics_rounded,
                                  'statistics'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const Teachingprayer());
                                  },
                                  FlutterIslamicIcons.kowtow,
                                  'teaching_prayer'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const WuduAndGhusle());
                                  },
                                  FlutterIslamicIcons.wudhu,
                                  'wudu_ghusl'.tr,
                                ),
                                mycategory(
                                  () {
                                    if (_isanonymous(context)) {
                                      return;
                                    }

                                    Get.to(() => QiblaDirection());
                                  },
                                  FlutterIslamicIcons.qibla,
                                  'qibla_direction'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => Tasbih());
                                  },
                                  FlutterIslamicIcons.tasbihHand,
                                  'electronic_tasbih'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const FridaySunnah());
                                  },
                                  FlutterIslamicIcons.community,
                                  'friday_sunnahs'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const Ahadith());
                                  },
                                  FlutterIslamicIcons.quran,
                                  'al-arba\'in_nawawiyyah'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const Hajandomrapage());
                                  },
                                  FlutterIslamicIcons.kaaba,
                                  'hajj_umrah'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const Praise());
                                  },
                                  Icons.volunteer_activism_rounded,
                                  'al-Hamd'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const SeekingForgivnes());
                                  },
                                  FlutterIslamicIcons.prayingPerson,
                                  'istighfar'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const Islamicruqya());
                                  },
                                  FontAwesomeIcons.bookQuran,
                                  'islamic_ruqyah'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const QuranicSupplications());
                                  },
                                  Icons.favorite_rounded,
                                  'quranic_supplications'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const ProphetsSupplication());
                                  },
                                  MdiIcons.accountVoice,
                                  'prophets_supplications'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.toNamed("hijri");
                                  },
                                  FlutterIslamicIcons.calendar,
                                  'islamic_calendar'.tr,
                                ),
                                mycategory(
                                  () {
                                    Get.to(() => const AllahNames());
                                  },
                                  FlutterIslamicIcons.allah99,
                                  'asma_ul-husna'.tr,
                                ),
                                mycategory(
                                  () {
                                    timespagectrl.getcurrentpage();
                                    Get.toNamed("salattime");
                                  },
                                  Icons.access_time_filled_sharp,
                                  'mawaqit'.tr,
                                ),
                              ],
                            ),
                          ),
                    ),
                    SizedBox(
                      width: Sizeconfig.screenwidth,
                      height: Sizeconfig.screenheight! / 80,
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
}

bool _isanonymous(context) {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null || currentUser.isAnonymous) {
    AwesomeDialog(
      context: context,
      title: 'anonymous_user'.tr,
      desc: 'guest_login_warning'.tr,
      dialogType: DialogType.error,
    ).show();
    return true;
  }
  return false;
}

Widget mycategory(VoidCallback ontap, IconData categoryicon, String iconname) {
  return Material(
    elevation: 2,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: ontap,
      child: GetBuilder<MyHomeController>(
        builder:
            (_) => Container(
              decoration: BoxDecoration(
                color:
                    Get.isDarkMode
                        ? kmaincolor2dark.withValues(alpha: 0.7)
                        : Colors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          Get.isDarkMode
                              ? kmaincolor2dark.withValues(alpha: 0.1)
                              : Colors.grey.withValues(alpha: 0.1),
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
