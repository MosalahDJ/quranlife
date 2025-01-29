import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:audioplayers/audioplayers.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: kmaincolor4.withOpacity(0.2),
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
                            color: kmaincolor4,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "$ayahNumberInSurah",
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : const Color(0xFF280F01),
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
                          style: const TextStyle(
                            fontFamily: 'UthmanicHafs',
                            fontSize: 20,
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
                                  (quranctrl.playerState.value ==
                                              PlayerState.playing &&
                                          quranctrl.currentPlayingAyah.value ==
                                              ayahNumber)
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline_rounded,
                                  () async {
                                if (ayahaudio != null) {
                                  if (quranctrl.playerState.value ==
                                          PlayerState.playing &&
                                      quranctrl.currentPlayingAyah.value ==
                                          ayahNumber) {
                                    await quranctrl.player.pause();
                                  } else {
                                    await quranctrl.playaudio(
                                        ayahaudio!, ayahNumber);
                                  }
                                }
                              }))),
                      const SizedBox(
                        width: 20,
                      ),
                      GetBuilder<QuraanController>(
                        builder: (c) => _iconbuttons(
                            quranctrl.ifAyahAlredySaved(ayahNumber)
                                ? (icon ?? Icons.bookmark_added_rounded)
                                : Icons.bookmark_outline_rounded, () {
                          quranctrl.saveAyah(surahNumber, ayahNumber, ayahText,
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
          height: 3,
        ),
      ],
    );
  }
}

InkWell _iconbuttons(IconData icon, VoidCallback onpressed) => InkWell(
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
