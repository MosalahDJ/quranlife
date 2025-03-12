// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/ahadith%20controller/ahadith_controller.dart';
import 'package:project/features/controller/fetching%20data%20controller/allah_names_controller.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';

class Wirds extends StatelessWidget {
  Wirds({super.key, required this.mycolor});

  final Color mycolor;
  final QuraanController quranctrl = Get.find();
  final AllahNamesController allahnamesctrl = Get.find();
  final AhadithController hadithctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    //scrollview

    return SingleChildScrollView(
      child: SizedBox(
        width: Sizeconfig.screenwidth!,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            //quraan wird
            WirdCard(
              mycolor: mycolor,
              text:
                  "${quranctrl.dailyAyah.value['surahName']} - ${'verses'.tr} ${quranctrl.dailyAyah.value['ayahNumber']} - ",
              text2: "\uFD3F${quranctrl.dailyAyah.value['ayahText']}\uFD3E",
              cardtype: "quran_wird".tr,
              fontfamily1: "Amiri",
              fontfamily2: "Amiri",
            ),

            SizedBox(height: Sizeconfig.screenheight! / 100),

            //Hadit wird
            WirdCard(
              mycolor: mycolor,
              text: hadithctrl.dailyHadith.value["Hadithnarator"],
              cardtype: "hadith_wird".tr,
              text2: "${hadithctrl.dailyHadith.value["Hadithtext"]}",
              text3: "${hadithctrl.dailyHadith.value["Hadithsource"]}",
              fontfamily2: "Amiri",
            ),
            SizedBox(height: Sizeconfig.screenheight! / 100),
            //ism allah of the day
            WirdCard(
              mycolor: mycolor,
              text: allahnamesctrl.dailyname.value["name"],
              cardtype: "allah_names".tr,
              text2: allahnamesctrl.dailyname.value["nameText"],
              titlesize: 36,
              fontfamily1: "Amiri",
            ),
            SizedBox(height: Sizeconfig.screenheight! / 100),
          ],
        ),
      ),
    );
  }
}

//Standar card of wirds

class WirdCard extends StatelessWidget {
  const WirdCard({
    super.key,
    required this.cardtype,
    required this.text,
    this.text2,
    this.text3,
    required this.mycolor,
    this.titlesize,
    this.fontfamily1,
    this.fontfamily2,
    this.fontfamily3,
  });

  final String cardtype;
  final String text;
  final String? text2;
  final String? text3;
  final Color mycolor;
  final double? titlesize;
  final String? fontfamily1;
  final String? fontfamily2;
  final String? fontfamily3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          cardtype,
          style: TextStyle(
            fontSize: 20,
            color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          ),
        ),
        Card(
          color: mycolor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: LayoutBuilder(
                    builder:
                        (context, constraints) => SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(width: Sizeconfig.screenwidth),
                              Text(
                                text,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(
                                  fontFamily: fontfamily1 ?? "Cairo",
                                  height: 1.8,
                                  fontSize: titlesize ?? 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color
                                      ?.withValues(alpha: 0.87),
                                ),
                              ),
                              const SizedBox(height: 16),
                              text2 != null
                                  ? Text(
                                    text2!,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      height: 1.6,
                                      color:
                                          Get.isDarkMode
                                              ? kmaincolor4
                                              : kmaincolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: fontfamily2 ?? "Cairo",
                                    ),
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                  )
                                  : const SizedBox(),
                              text3 != null
                                  ? const SizedBox(height: 16)
                                  : const SizedBox(),
                              text3 != null
                                  ? Text(
                                    text3!,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      height: 1.6,
                                      color:
                                          Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: fontfamily3 ?? "Cairo",
                                    ),
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                  )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
