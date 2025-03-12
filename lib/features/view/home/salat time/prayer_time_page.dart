import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/view/home/salat%20time/widgets/currunet_pray_time.dart';
import 'package:project/features/view/home/salat%20time/widgets/prayer_times_table.dart';

class PrayerTimesPage extends StatelessWidget {
  const PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: 'prayer_times'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                "upcoming_feature_title".tr,
                "upcoming_feature_desc".tr,
                backgroundColor: Colors.transparent.withValues(alpha: 0.3),
                colorText: const Color(0xFFFFFFFF),
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                padding: const EdgeInsets.all(20),
              );
            },
            icon: const Icon(
              Icons.settings_applications_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/images/background_image/newbackground.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizeconfig.screenheight! * 0.02,
                      horizontal: Sizeconfig.screenwidth! * 0.04,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: Sizeconfig.screenheight! * 0.03),
                        // Quran Verse Card
                        Card(
                          color: Colors.transparent,
                          child: Container(
                            width: Sizeconfig.screenwidth,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const ShimmerText(
                              text:
                                  "\uFD3F  إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا \uFD3E \nصَدَقَ اللهُ العَظِيم",
                              textalign: TextAlign.center,
                              textdirection: TextDirection.rtl,
                              begin: 2,
                              end: -2,
                              color: Color(0xFFFFD700),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontFamily: 'Amiri', // Add an Arabic font
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: Sizeconfig.screenheight! * 0.03),

                        // Current Prayer Time Card
                        CurrentPrayTime(
                          morebuttoncolor: Colors.white,
                          onpressed: () {},
                          moreIconVisibility: false,
                          textcolor2: Colors.white,
                          textcolor: kmaincolor4,
                          elevation: 2,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),

                        SizedBox(height: Sizeconfig.screenheight! * 0.03),

                        // Prayer Times Table
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Prayertimestable(),
                        ),

                        SizedBox(height: Sizeconfig.screenheight! * 0.02),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
