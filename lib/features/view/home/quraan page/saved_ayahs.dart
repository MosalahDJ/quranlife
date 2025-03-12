import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:project/features/controller/quraan%20controller/saving_controller.dart';
import 'package:project/features/view/home/quraan%20page/surah_page.dart';
import 'package:project/features/view/home/quraan%20page/widgets/ayah_widget.dart';

class SavedAyahs extends StatelessWidget {
  const SavedAyahs({super.key});

  @override
  Widget build(BuildContext context) {
    final QuraanController quranctrl = Get.find();

    final SavingController savecetrl = Get.put(SavingController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Get.isDarkMode ? kmaincolor2dark : Colors.transparent,
        appBar: AppBar(
          title: Text(
            'saved_ayahs'.tr,
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
            GetBuilder<SavingController>(
              builder:
                  (c) =>
                      savecetrl.savedAyahs.isEmpty
                          ? SafeArea(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bookmark_border,
                                    size: 70,
                                    color:
                                        Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'no_saved_ayahs'.tr,
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
                              itemCount: savecetrl.savedAyahs.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => SurahPage(
                                        surah:
                                            quranctrl.surahs[savecetrl
                                                    .savedAyahs[index]["surahNumber"] -
                                                1],
                                        initialAyahNumber:
                                            savecetrl
                                                .savedAyahs[index]["ayahNumberinsurah"],
                                      ),
                                    );
                                  },
                                  child: AyahWidget(
                                    savedvisibility: true,
                                    favoritevisibility: false,
                                    title:
                                        savecetrl
                                            .savedAyahs[index]["surahName"],
                                    titlevisibility: true,
                                    ayahNumber:
                                        savecetrl
                                            .savedAyahs[index]["ayahNumber"],
                                    ayahNumberInSurah:
                                        savecetrl
                                            .savedAyahs[index]["ayahNumberinsurah"],
                                    ayahText:
                                        savecetrl.savedAyahs[index]["ayahText"],
                                    surahName:
                                        savecetrl
                                            .savedAyahs[index]["surahName"],
                                    surahNumber:
                                        savecetrl
                                            .savedAyahs[index]["surahNumber"],
                                    icon: Icons.delete_outline_outlined,
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
