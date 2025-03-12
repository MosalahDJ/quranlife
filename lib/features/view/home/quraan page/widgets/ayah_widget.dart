import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/quraan%20controller/audioplayer_controller.dart';
import 'package:project/features/controller/quraan%20controller/favorite_controller.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/features/controller/quraan%20controller/saving_controller.dart';
import 'package:project/features/controller/statistics%20controller/statistics_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AyahWidget extends StatelessWidget {
  AyahWidget({
    super.key,
    required this.surahNumber,
    required this.ayahNumber,
    required this.ayahText,
    required this.surahName,
    required this.ayahNumberInSurah,
    this.icon,
    required this.titlevisibility,
    this.title,
    this.ayahaudio,
    required this.savedvisibility,
    required this.favoritevisibility,
  });

  final int surahNumber;
  final int ayahNumber;
  final String ayahText;
  final bool titlevisibility;
  final bool savedvisibility;
  final bool favoritevisibility;
  final String surahName;
  final int ayahNumberInSurah;
  final IconData? icon;
  final String? title;
  final String? ayahaudio;

  final QuraanController quranctrl = Get.find();

  final AudioplayerController audioctrl = Get.put(AudioplayerController());
  final SavingController savectrl = Get.put(SavingController());
  final FavoriteController favoritectrl = Get.put(FavoriteController());
  final StatisticsController statsController = Get.put(StatisticsController());

  final Key visibilityKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibilityKey,
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.7) {
          // Consider verse read when 70% visible
          statsController.incrementVersesCount();
        }
      },
      child: Column(
        children: [
          Card(
            elevation: 1,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color:
                    Get.isDarkMode
                        ? kmaincolor2dark.withValues(alpha: 0.7)
                        : Colors.white.withValues(alpha: 0.7),
              ),
              height: 50,
              width: Sizeconfig.screenwidth! / 1.07,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Get.isDarkMode
                                    ? kmaincolor2dark.withValues(alpha: 0.7)
                                    : Colors.white.withValues(alpha: 0.7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Text(
                            "$ayahNumberInSurah",
                            style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: titlevisibility,
                      child: Center(
                        child: Text(
                          title ?? "",
                          style: TextStyle(
                            fontFamily: 'UthmanicHafs',
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 10),
                        Visibility(
                          visible: !titlevisibility,
                          child: Obx(
                            () => _iconbuttons(
                              (audioctrl.playerState.value ==
                                          PlayerState.playing &&
                                      audioctrl.currentPlayingAyah.value ==
                                          ayahNumber)
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle_outline_rounded,
                              () async {
                                if (ayahaudio != null) {
                                  if (audioctrl.playerState.value ==
                                          PlayerState.playing &&
                                      audioctrl.currentPlayingAyah.value ==
                                          ayahNumber) {
                                    await audioctrl.player.pause();
                                  } else {
                                    await audioctrl.playaudio(
                                      ayahaudio!,
                                      ayahNumber,
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Visibility(
                          visible: savedvisibility,
                          child: GetBuilder<QuraanController>(
                            builder:
                                (c) => _iconbuttons(
                                  savectrl.ifAyahAlredySaved(ayahNumber)
                                      ? (icon ?? Icons.bookmark_added_rounded)
                                      : Icons.bookmark_outline_rounded,
                                  () {
                                    savectrl.saveAyah(
                                      surahNumber,
                                      ayahNumber,
                                      ayahText,
                                      surahName,
                                      ayahNumberInSurah,
                                    );
                                  },
                                ),
                          ),
                        ),
                        Visibility(
                          visible: savedvisibility,
                          child: const SizedBox(width: 10),
                        ),
                        Visibility(
                          visible: favoritevisibility,
                          child: GetBuilder<FavoriteController>(
                            builder:
                                (c) => _iconbuttons(
                                  favoritectrl.ifAyahAlredyfavorite(ayahNumber)
                                      ? (icon ?? Icons.favorite)
                                      : Icons.favorite_border,
                                  () {
                                    favoritectrl.favoriteAyah(
                                      surahNumber,
                                      ayahNumber,
                                      ayahText,
                                      surahName,
                                      ayahNumberInSurah,
                                    );
                                  },
                                ),
                          ),
                        ),
                        Visibility(
                          visible: favoritevisibility,
                          child: const SizedBox(width: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: Sizeconfig.screenwidth! / 1.16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ayahText,
                style: TextStyle(
                  fontFamily: 'UthmanicHafs',
                  fontSize: 28,
                  color:
                      Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
                ),
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const Divider(endIndent: 30, indent: 30, thickness: 0.5),
          const SizedBox(height: 1),
        ],
      ),
    );
  }
}

InkWell _iconbuttons(IconData icon, VoidCallback onpressed) => InkWell(
  borderRadius: const BorderRadius.all(Radius.circular(200)),
  onTap: onpressed,
  child: Icon(
    icon,
    color: Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
    weight: 2,
    size: 30,
    shadows: [
      Shadow(
        offset: const Offset(1, 1),
        blurRadius: 2,
        color: Colors.black26.withValues(alpha: 0.1),
      ),
    ],
  ),
);
