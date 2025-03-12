import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/cusstom_indicator.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/view/home/categories/categories_pages/ai_bot_page.dart';
import 'package:project/features/view/home/categories/categories_pages/messaging_page.dart';
import 'package:project/features/view/home/categories/categories_pages/statistics_page.dart';
import 'package:project/features/view/home/home%20page/widgets/cart_card.dart';
import 'package:project/features/view/home/home%20page/widgets/salawat_pageview.dart';
import 'package:project/features/view/home/home%20page/widgets/wirds.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});
  final MyHomeController homectrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final LanguageController langctrl = Get.find();
  final FadeAnimationController fadectrl = Get.find();
  final double _sectionSpacing = 24.0;
  final double _contentPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool shouldPop =
              await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('are_you_sure'.tr),
                      content: Text('leave_app'.tr),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('no'.tr),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('yes'.tr),
                        ),
                      ],
                    ),
              ) ??
              false;
          if (shouldPop) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: ShimmerText(
            text: 'quranlife'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Gradientbackground(
              gradientcolor: [
                kmaincolor,
                Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
              ],
            ),
            SizedBox(
              height: Sizeconfig.screenheight,
              width: Sizeconfig.screenwidth,
              child: Image.asset(
                "lib/core/assets/images/background_image/arch.jpg",
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation<double>(0.2),
                height: Sizeconfig.screenheight,
                width: Sizeconfig.screenwidth,
              ),
            ),
            SafeArea(
              child: RefreshIndicator(
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                onRefresh: () async {
                  await fpfctrl.fetchPrayerTimes();
                  return Future.delayed(const Duration(milliseconds: 1500), () {
                    fadectrl.rebuildKey.value = UniqueKey();
                    fadectrl.rebuildKey1.value = UniqueKey();
                    fadectrl.rebuildKey2.value = UniqueKey();
                    fadectrl.rebuildKey3.value = UniqueKey();
                    fadectrl.rebuildKey4.value = UniqueKey();
                    fadectrl.rebuildKey5.value = UniqueKey();
                    fadectrl.rebuildKey6.value = UniqueKey();
                    fadectrl.currentPage = 0;
                    homectrl.update();
                  });
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(_contentPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Prayer Times Section
                        FadeInLeft(
                          key: fadectrl.rebuildKey.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: SalawatPageview(
                            morebuttoncolor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: _sectionSpacing / 3),
                        FadeInLeft(
                          key: fadectrl.rebuildKey1.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: Center(
                            child: Obx(
                              () => CustomIndicator(
                                dotscolor:
                                    Get.isDarkMode
                                        ? const Color(0xffFD9B63)
                                        : kmaincolor,
                                dotscount: 2,
                                indposition: homectrl.salawatPage.value,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: _sectionSpacing / 2),

                        // Categories Section
                        FadeInRight(
                          key: fadectrl.rebuildKey2.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: _buildSectionHeader(
                            context,
                            "category".tr,
                            () {
                              homectrl.selected = 1;
                              homectrl.update();
                            },
                          ),
                        ),
                        FadeInRight(
                          key: fadectrl.rebuildKey3.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: GetBuilder<ThemeController>(
                            builder:
                                (c) => Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                    ],
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(height: _sectionSpacing / 2),

                        // Nearest Mosque Section
                        const SizedBox(height: 12),
                        FadeInLeft(
                          key: fadectrl.rebuildKey4.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: CartCard(
                            elevation: 2,
                            color:
                                Get.isDarkMode
                                    ? kmaincolor2dark.withValues(alpha: 0.7)
                                    : Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        SizedBox(height: _sectionSpacing),

                        // Daily Wird Section
                        FadeInRight(
                          key: fadectrl.rebuildKey5.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: _buildSectionHeader(
                            context,
                            "daily_wird".tr,
                            () {
                              homectrl.showShareDialog(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        FadeInRight(
                          key: fadectrl.rebuildKey6.value,
                          duration: const Duration(seconds: 1),
                          animate: true,
                          child: _buildWirdCard(),
                        ),
                        SizedBox(height: _sectionSpacing),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    VoidCallback moreIconOnpressed,
  ) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: Sizeconfig.screenheight! * 0.055,
        width: Sizeconfig.screenwidth,
        child: Stack(
          children: [
            //title
            Positioned(
              top: Sizeconfig.screenheight! / 200,
              left:
                  langctrl.language.value == "ar"
                      ? Sizeconfig.screenwidth! / 2
                      : 0,
              right:
                  langctrl.language.value == "ar"
                      ? 0
                      : Sizeconfig.screenwidth! / 2.5,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // more button
            Positioned(
              top: 0,
              left:
                  langctrl.language.value == "ar"
                      ? 0
                      : Sizeconfig.screenwidth! / 1.25,
              right:
                  langctrl.language.value == "ar"
                      ? Sizeconfig.screenwidth! / 1.25
                      : 0,
              child: Material(
                elevation: 0,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  alignment: Alignment.center,
                  onPressed: moreIconOnpressed,
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget _buildWirdCard() {
    return Wirds(
      mycolor:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.7)
              : Colors.white.withValues(alpha: 0.7),
    );
  }
}
