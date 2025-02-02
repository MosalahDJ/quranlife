import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/quraan%20controller/audioplayer_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quranlife/features/controller/quraan%20controller/saving_controller.dart';

class AyahWidget extends StatelessWidget {
  AyahWidget(
      {super.key,
      required this.surahNumber,
      required this.ayahNumber,
      required this.ayahText,
      required this.surahName,
      required this.ayahNumberInSurah,
      this.icon,
      required this.titlevisibility,
      this.title,
      this.ayahaudio});

  final int surahNumber;
  final int ayahNumber;
  final String ayahText;
  final bool titlevisibility;
  final String surahName;
  final int ayahNumberInSurah;
  final IconData? icon;
  final String? title;
  final String? ayahaudio;

  final QuraanController quranctrl = Get.find();
  final AudioplayerController audioctrl = Get.find();
  final SavingController savectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 1,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Get.isDarkMode
                  ? kmaincolor2dark.withOpacity(0.7)
                  : Colors.white.withOpacity(0.7),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? kmaincolor2dark.withOpacity(0.7)
                                : Colors.white.withOpacity(0.7),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "$ayahNumberInSurah",
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 18),
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
                      )),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Visibility(
                          visible: !titlevisibility,
                          child: Obx(() => _iconbuttons(
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
                                        ayahaudio!, ayahNumber);
                                  }
                                }
                              }))),
                      const SizedBox(
                        width: 20,
                      ),
                      GetBuilder<QuraanController>(
                        builder: (c) => _iconbuttons(
                            savectrl.ifAyahAlredySaved(ayahNumber)
                                ? (icon ?? Icons.bookmark_added_rounded)
                                : Icons.bookmark_outline_rounded, () {
                          savectrl.saveAyah(surahNumber, ayahNumber, ayahText,
                              surahName, ayahNumberInSurah);
                        }),
                      ),
                      const SizedBox(
                        width: 10,
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
                      Get.isDarkMode ? Colors.white : const Color(0xFF280F01)),
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        const Divider(
          endIndent: 30,
          indent: 30,
          thickness: 0.5,
        ),
        const SizedBox(
          height: 1,
        ),
      ],
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
          color: Colors.black26.withOpacity(0.1),
        )
      ],
    ));
