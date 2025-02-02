import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
// import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class Wirds extends StatelessWidget {
  Wirds({super.key, required this.mycolor});

  final Color mycolor;
  final QuraanController quranctrl = Get.find();

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
              text: "\uFD3F ${quranctrl.dailyAyah.value['ayahText']} \uFD3E",
              text2:
                  "${quranctrl.dailyAyah.value['surahName']} - ${quranctrl.dailyAyah.value['ayahNumber']}",
              cardtype: "quran_wird".tr,
            ),

            SizedBox(
              height: Sizeconfig.screenheight! / 100,
            ),

            //Hadit wird

            WirdCard(
              mycolor: mycolor,
              text:
                  "حَدَّثَنَا مُحَمَّدُ بْنُ العَلاَءِ، قَالَ: حَدَّثَنَا أَبُو أُسَامَةَ، عَنْ بُرَيْدٍ، عَنْ أَبِي بُرْدَةَ، عَنْ أَبِي مُوسَى الأشعري رضي الله تعالى عنه قَالَ: سُئِلَ النَّبِيُّ ﷺ عَنْ أَشْيَاءَ كَرِهَهَا، فَلَمَّا أُكْثِرَ عَلَيْهِ غَضِبَ، ثُمَّ قَالَ لِلنَّاسِ: سَلُونِي عَمَّا شِئْتُمْ قَالَ رَجُلٌ: مَنْ أَبِي؟ قَالَ: أَبُوكَ حُذَافَةُ فَقَامَ آخَرُ فَقَالَ: مَنْ أَبِي يَا رَسُولَ اللَّهِ؟ فَقَالَ: أَبُوكَ سَالِمٌ مَوْلَى شَيْبَةَ فَلَمَّا رَأَى عُمَرُ مَا فِي وجْهِهِ قَالَ: يَا رَسُولَ اللَّهِ، إِنَّا نَتُوبُ إِلَى اللَّهِ .",
              cardtype: "hadith_wird".tr,
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 100,
            ),

            //ism allah of the day

            WirdCard(
              mycolor: mycolor,
              text:
                  "الباسط :يقتر على من يشاء ويوسع على من يشاء على حسب ما يرى من المصلحة لعباده.",
              cardtype: "allah_names".tr,
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 100,
            ),
          ],
        ),
      ),
    );
  }
}

//Standar card of wirds

class WirdCard extends StatelessWidget {
  const WirdCard({
    required this.text,
    required this.cardtype,
    super.key,
    required this.mycolor,
    this.text2,
  });

  final String cardtype;
  final String text;
  final String? text2;
  final Color mycolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          cardtype,
          style: TextStyle(
              fontSize: 20, color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
        ),
        Card(
            color: mycolor,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: Sizeconfig.screenwidth! / 1.05,
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    text,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Get.isDarkMode ? Colors.white : textcolor1,
                    ),
                  ),
                  Text(
                    textDirection: TextDirection.rtl,
                    text2 ?? "",
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Get.isDarkMode ? Colors.white : textcolor1,
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
