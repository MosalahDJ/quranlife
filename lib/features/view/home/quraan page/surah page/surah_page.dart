import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/model/qurandata.dart';

class SurahPage extends StatelessWidget {
  const SurahPage(
      {required this.surah,
      required this.verses,
      required this.surahNumber,
      super.key});
  final Surah surah;
  final List<Ayah> verses;
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
        title: Text(
          surah.name,
          style: const TextStyle(
            fontFamily: 'UthmanicHafs',
          ),
        ),
        foregroundColor: kmaincolor4,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded))),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            color: Colors.transparent,
            child: SizedBox(
              height: Sizeconfig.screenheight! / 2.2,
              width: Sizeconfig.screenwidth! / 1.12,
              child: Stack(
                children: [
                  Positioned(
                    top: Sizeconfig.screenheight! / 35,
                    left: Sizeconfig.screenwidth! / 5,
                    right: -80,
                    bottom: -50,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        "lib/core/assets/images/background_image/6221013cR.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: Sizeconfig.screenheight! / 2.2,
                    width: Sizeconfig.screenwidth! / 1.12,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: kmaincolor4.withOpacity(0.6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        _cardtext(surah.name, 29),
                        _cardtext(
                            '${surah.revelationType.tr}, ${surah.ayahs.length} ${"verses".tr}',
                            20),
                        const Divider(
                          endIndent: 40,
                          indent: 40,
                          thickness: 1,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: Sizeconfig.screenheight! / 8,
                          width: Sizeconfig.screenwidth! / 1.2,
                          child: Image.asset(
                            "lib/core/assets/images/background_image/isti3ada.png",
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                        Visibility(
                          visible: surah.number == 9 || surah.number == 1
                              ? false
                              : true,
                          child: SizedBox(
                            height: Sizeconfig.screenheight! / 8,
                            width: Sizeconfig.screenwidth! / 1.2,
                            child: Image.asset(
                              "lib/core/assets/images/background_image/basmala.png",
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 20,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: surah.ayahs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: kmaincolor4.withOpacity(0.1),
                    ),
                    height: 60,
                    width: Sizeconfig.screenwidth! / 1.16,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: kmaincolor4,
                            child: Text(
                              "{${surah.ayahs[index].numberInSurah}}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _iconbuttons(
                                  Icons.play_circle_outline_rounded, () {}),
                              const SizedBox(
                                width: 10,
                              ),
                              _iconbuttons(
                                  Icons.bookmark_outline_rounded, () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: Sizeconfig.screenwidth! / 1.16,
                    child: Text(
                      verses[index].text,
                      style: const TextStyle(
                          fontFamily: 'UthmanicHafs', fontSize: 34),
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    endIndent: 30,
                    indent: 30,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              );
            },
          ),
        ],
      )),
    );
  }

  IconButton _iconbuttons(IconData icon, VoidCallback onpressed) => IconButton(
      onPressed: onpressed,
      icon: Icon(
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

  Text _cardtext(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'UthmanicHafs',
        fontSize: size,
        height: 2,
        color: Colors.white,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
