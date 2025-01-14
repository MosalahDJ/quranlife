import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/view/home/categories_page/categories_page.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/salawat_pageview.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/cart_card.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/wirds.dart';
import 'package:quranlife/core/widgets/cusstom_indicator.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({
    super.key,
  });
  final MyHomeController homectrl = Get.find();
  final GoogleSignoutController signoutctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final LanguageController langctrl = Get.find();

  final double _sectionSpacing = 24.0;
  final double _contentPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('quranlife'.tr,
            style: Theme.of(context).textTheme.headlineSmall),
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
              onRefresh: () async {
                await fpfctrl.fetchPrayerTimes();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(_contentPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Prayer Times Section
                      SalawatPageview(),
                      SizedBox(height: _sectionSpacing / 3),
                      Center(
                        child: GetBuilder<MyHomeController>(
                          builder: (c) => CustomIndicator(
                            dotscolor: Get.isDarkMode
                                ? const Color(0xffFD9B63)
                                : kmaincolor,
                            dotscount: 2,
                            indposition:
                                homectrl.homepagecontroller.page?.toInt() ?? 0,
                          ),
                        ),
                      ),
                      SizedBox(height: _sectionSpacing / 2),

                      // Categories Section
                      _buildSectionHeader(
                        context,
                        "category".tr,
                        () {},
                      ),
                      GetBuilder<ThemeController>(
                        builder: (c) => Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1,
                            children: [
                              mycategory(() {}, MdiIcons.robot, 'ai_bot'.tr),
                              mycategory(() {}, Icons.people_alt_rounded,
                                  'community'.tr),
                              mycategory(() {}, Icons.analytics_rounded,
                                  'statistics'.tr),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: _sectionSpacing / 2),

                      // Nearest Mosque Section
                      const SizedBox(height: 12),
                      CartCard(
                        elevation: 2,
                        color: Get.isDarkMode
                            ? kmaincolor2dark.withOpacity(0.7)
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(height: _sectionSpacing),

                      // Daily Wird Section
                      _buildSectionHeader(
                        context,
                        "daily_wird".tr,
                        () {},
                      ),
                      const SizedBox(height: 12),
                      _buildWirdCard(),
                      SizedBox(height: _sectionSpacing),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, String title, VoidCallback moreIconOnpressed) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: Sizeconfig.screenheight! * 0.055,
        width: Sizeconfig.screenwidth,
        child: Stack(
          children: [
            Positioned(
              top: Sizeconfig.screenheight! / 200,
              left: langctrl.language.value == "ar"
                  ? Sizeconfig.screenwidth! / 2
                  : 0,
              right: langctrl.language.value == "ar"
                  ? 0
                  : Sizeconfig.screenwidth! / 2,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Positioned(
              top: 0,
              left: langctrl.language.value == "ar"
                  ? 0
                  : Sizeconfig.screenwidth! / 1.25,
              right: langctrl.language.value == "ar"
                  ? Sizeconfig.screenwidth! / 1.25
                  : 0,
              child: Material(
                elevation: 0,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  alignment: Alignment.center,
                  onPressed: title == "category".tr
                      ? () => Get.to(() => const CategoriesPage())
                      : moreIconOnpressed,
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
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? kmaincolor2dark.withOpacity(0.7)
                  : Colors.white.withOpacity(0.7),
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

  Widget _buildWirdCard() {
    return Wirds(
      mycolor: Get.isDarkMode
          ? kmaincolor2dark.withOpacity(0.7)
          : Colors.white.withOpacity(0.7),
    );
  }
}
