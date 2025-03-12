import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/features/controller/quraan%20controller/favorite_controller.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:project/features/view/home/quraan%20page/surah_page.dart';
import 'package:project/features/view/home/quraan%20page/widgets/ayah_widget.dart';

class Favorite extends StatelessWidget {
  Favorite({super.key});
  final QuraanController quranctrl = Get.find();

  final FavoriteController favoritectrl = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Get.isDarkMode ? kmaincolor2dark : Colors.transparent,
        appBar: AppBar(
          title: Text(
            'favorite'.tr,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            // Add paper background
            Get.isDarkMode
                ? Gradientbackground(
                  height: Sizeconfig.screenheight,
                  gradientcolor: [kmaincolor, kmaincolor3dark],
                )
                : SizedBox(
                  height: Sizeconfig.screenheight,
                  width: Sizeconfig.screenwidth,
                  child: Image.asset(
                    "lib/core/assets/images/background_image/paper.jpg",
                    fit: BoxFit.cover,
                    opacity: AlwaysStoppedAnimation<double>(
                      Get.isDarkMode ? 0.1 : 1,
                    ),
                    height: Sizeconfig.screenheight,
                    width: Sizeconfig.screenwidth,
                  ),
                ),
            GetBuilder<FavoriteController>(
              builder:
                  (c) =>
                      favoritectrl.favoriteAyahs.isEmpty
                          ? SafeArea(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    size: 70,
                                    color:
                                        Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'no_favorite_ayahs'.tr,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          : SafeArea(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: favoritectrl.favoriteAyahs.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => SurahPage(
                                        surah:
                                            quranctrl.surahs[favoritectrl
                                                    .favoriteAyahs[index]["surahNumber"] -
                                                1],
                                        initialAyahNumber:
                                            favoritectrl
                                                .favoriteAyahs[index]["ayahNumberinsurah"],
                                      ),
                                    );
                                  },
                                  child: AyahWidget(
                                    savedvisibility: false,
                                    favoritevisibility: true,
                                    title:
                                        favoritectrl
                                            .favoriteAyahs[index]["surahName"],
                                    titlevisibility: true,
                                    ayahNumber:
                                        favoritectrl
                                            .favoriteAyahs[index]["ayahNumber"],
                                    ayahNumberInSurah:
                                        favoritectrl
                                            .favoriteAyahs[index]["ayahNumberinsurah"],
                                    ayahText:
                                        favoritectrl
                                            .favoriteAyahs[index]["ayahText"],
                                    surahName:
                                        favoritectrl
                                            .favoriteAyahs[index]["surahName"],
                                    surahNumber:
                                        favoritectrl
                                            .favoriteAyahs[index]["surahNumber"],
                                    icon: Icons.favorite,
                                  ),
                                );
                              },
                            ),
                          ),
            ),
          ],
        ),
      ),
    );
  }
}
