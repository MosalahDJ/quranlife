import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:quranlife/features/view/home/quraan%20page/surah%20page/surah_page.dart';

class Surahviewpage extends StatelessWidget {
  Surahviewpage({
    required this.backround,
    super.key,
  });

  final Widget backround;

  final MyHomeController homectrl = Get.find();
  final QuraanController quranctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //gradient background

      backround,

      SizedBox(
        height: Sizeconfig.screenheight,
        width: Sizeconfig.screenwidth,
        child: Image.asset(
          "lib/core/assets/images/background_image/arch.jpg",
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation<double>(0.2),
          height: Sizeconfig.screenheight,
          width: Sizeconfig.screenwidth,
        ),
      ),
      //front of page

      Positioned(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2),

            //gridviewbuilder
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: quranctrl.surahs.length,
                itemBuilder: (context, index) {
                  final surah = quranctrl.surahs[index];
                  final ayahs = quranctrl.surahs[index].ayahs;

                  //surah name container
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () {
                        Get.to(
                          SurahPage(
                            surah: surah,
                            verses: ayahs,
                            surahNumber: index,
                          ),
                        );
                      },

                      // It is preferable to use Ink with InkWell
                      child: Material(
                        elevation: 2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: Get.isDarkMode
                                ? kmaincolor2dark.withOpacity(0.7)
                                : Colors.white.withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  surah.name.tr,
                                  style: const TextStyle(fontFamily: "Amiri"),
                                ),
                                surah.revelationType == "Medinan"
                                    ? const Icon(
                                        FlutterIslamicIcons.solidMinaret)
                                    : const Icon(FlutterIslamicIcons.kaaba),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    ]);
  }
}
