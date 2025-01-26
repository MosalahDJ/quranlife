import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';

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
      this.title});

  final int surahNumber;
  final int ayahNumber;
  final String ayahText;
  final bool titlevisibility;
  final String surahName;
  final int ayahNumberInSurah;
  final QuraanController quranctrl = Get.find();
  final IconData? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: kmaincolor4.withOpacity(0.1),
          ),
          height: 50,
          width: Sizeconfig.screenwidth! / 1.16,
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
                        "{$ayahNumberInSurah}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
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
                        child: _iconbuttons(
                            Icons.play_circle_outline_rounded, () {})),
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
        SizedBox(
          width: Sizeconfig.screenwidth! / 1.16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ayahText,
              style: const TextStyle(fontFamily: 'UthmanicHafs', fontSize: 28),
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
      color: kmaincolor4,
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
