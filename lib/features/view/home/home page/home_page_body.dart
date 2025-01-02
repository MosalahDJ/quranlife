import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/view/home/Drawer%20page/my_drawer.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/categories.dart';
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
      drawer: const MyDrawer(),
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
                      SizedBox(height: _sectionSpacing / 2),
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
                      SizedBox(height: _sectionSpacing),

                      // Categories Section
                      _buildSectionHeader(context, "category".tr),
                      ServiceCategorie(),
                      SizedBox(height: _sectionSpacing),

                      // Nearest Mosque Section
                      const SizedBox(height: 12),
                      _buildMosqueCard(context),
                      SizedBox(height: _sectionSpacing),

                      // Daily Wird Section
                      _buildSectionHeader(context, "daily_wird".tr),
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

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildMosqueCard(context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left:
              langctrl.language.value == "ar" ? Sizeconfig.screenwidth! / 3 : 0,
          right: langctrl.language.value == "ar"
              ? 0
              : langctrl.language.value == "fr"
                  ? Sizeconfig.screenwidth! / 9
                  : Sizeconfig.screenwidth! / 4,
          child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Text("search_for_a_mosque".tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ))),
        ),
        Positioned(
          child: SizedBox(
            height: Sizeconfig.screenheight! < 768
                ? Sizeconfig.screenheight! / 3.7
                : Sizeconfig.screenheight! > 1010
                    ? Sizeconfig.screenheight! / 6
                    : Sizeconfig.screenheight! / 4.5,
            child: CartCard(
              elevation: 2,
              color: Get.isDarkMode
                  ? kmaincolor2dark.withOpacity(0.7)
                  : Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ],
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
