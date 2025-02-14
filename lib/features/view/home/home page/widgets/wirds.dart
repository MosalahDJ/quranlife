import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/ahadith%20controller/ahadith_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/allah_names_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
// import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

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
              text: hadithctrl.dailyHadith.value["Hadithnarator"],
              cardtype: "hadith_wird".tr,
              text2:
                  "${hadithctrl.dailyHadith.value["Hadithtext"]} \n${hadithctrl.dailyHadith.value["Hadithsource"]}",
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 100,
            ),

            //ism allah of the day

            WirdCard(
              mycolor: mycolor,
              text: allahnamesctrl.dailyname.value["name"],
              cardtype: "allah_names".tr,
              text2: allahnamesctrl.dailyname.value["nameText"],
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        textAlign: TextAlign.start,
        cardtype,
        style: TextStyle(
            fontSize: 20, color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
      ),
      Card(
        color: mycolor,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: "Amiri",
                              height: 1.8,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.color
                                  ?.withOpacity(0.87),
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        text2 ?? "",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            height: 1.6,
                            color: kmaincolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Amiri"),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    ]);
  }
}
