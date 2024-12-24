import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
// import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class Wirds extends StatelessWidget {
  const Wirds({super.key, required this.mycolor});

  final Color mycolor;

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
                  "اللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ",
              cardtype: "   Quran Wird",
            ),

            SizedBox(
              height: Sizeconfig.screenheight! / 100,
            ),

            //Hadit wird

            WirdCard(
              mycolor: mycolor,
              text:
                  "حَدَّثَنَا مُحَمَّدُ بْنُ العَلاَءِ، قَالَ: حَدَّثَنَا أَبُو أُسَامَةَ، عَنْ بُرَيْدٍ، عَنْ أَبِي بُرْدَةَ، عَنْ أَبِي مُوسَى الأشعري رضي الله تعالى عنه قَالَ: سُئِلَ النَّبِيُّ ﷺ عَنْ أَشْيَاءَ كَرِهَهَا، فَلَمَّا أُكْثِرَ عَلَيْهِ غَضِبَ، ثُمَّ قَالَ لِلنَّاسِ: سَلُونِي عَمَّا شِئْتُمْ قَالَ رَجُلٌ: مَنْ أَبِي؟ قَالَ: أَبُوكَ حُذَافَةُ فَقَامَ آخَرُ فَقَالَ: مَنْ أَبِي يَا رَسُولَ اللَّهِ؟ فَقَالَ: أَبُوكَ سَالِمٌ مَوْلَى شَيْبَةَ فَلَمَّا رَأَى عُمَرُ مَا فِي وجْهِهِ قَالَ: يَا رَسُولَ اللَّهِ، إِنَّا نَتُوبُ إِلَى اللَّهِ .",
              cardtype: "   Hadith Wird",
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 100,
            ),

            //ism allah of the day

            WirdCard(
              mycolor: mycolor,
              text:
                  "الباسط :يقتر على من يشاء ويوسع على من يشاء على حسب ما يرى من المصلحة لعباده.",
              cardtype: "   Allah's Name of the Day",
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
  });

  final String cardtype;
  final String text;
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
              child: Text(
                text,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : textcolor,
                ),
              ),
            )),
      ],
    );
  }
}
