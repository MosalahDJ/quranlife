import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:quranlife/features/view/home/quraan%20page/surah%20page/surah_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/widgets/ayah_widget.dart';

class SavedAyahs extends StatelessWidget {
  SavedAyahs({super.key});
  final QuraanController quranctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
        appBar: AppBar(
          title: Text(
            'saved_ayahs'.tr,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: kmaincolor4,
          backgroundColor:
              Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
        ),
        body: GetBuilder<QuraanController>(
          builder: (c) => quranctrl.savedAyahs.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_border,
                          size: 70, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'no_saved_ayahs'.tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: quranctrl.savedAyahs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => SurahPage(
                            surah: quranctrl.surahs[
                                quranctrl.savedAyahs[index]["surahNumber"] - 1],
                            initialAyahNumber: quranctrl.savedAyahs[index]
                                ["ayahNumberinsurah"],
                          ),
                        );
                      },
                      child: AyahWidget(
                        title: quranctrl.savedAyahs[index]["surahName"],
                        titlevisibility: true,
                        ayahNumber: quranctrl.savedAyahs[index]["ayahNumber"],
                        ayahNumberInSurah: quranctrl.savedAyahs[index]
                            ["ayahNumberinsurah"],
                        ayahText: quranctrl.savedAyahs[index]["ayahText"],
                        surahName: quranctrl.savedAyahs[index]["surahName"],
                        surahNumber: quranctrl.savedAyahs[index]["surahNumber"],
                        icon: Icons.delete_outline_outlined,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
