import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/currunet_pray_time.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/prayer_times_table.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/salat_timebar.dart';

class PrayerTimesPage extends StatelessWidget {
  const PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizeconfig.screenheight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "lib/core/assets/images/background_image/newbackground.jpg"))),
      child: SizedBox(
        height: Sizeconfig.screenheight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //sized box
              SizedBox(
                height: Sizeconfig.screenheight! / 40,
              ),

              //salat page bar
              const Salattimebar(),

              //bottom of page
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: Sizeconfig.screenheight! / 1.14,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //text box
                        SizedBox(
                          width: Sizeconfig.screenwidth,
                          child: Card(
                            elevation: 0,
                            color: Colors.black.withOpacity(0.4),
                            child: const Text(
                              textDirection: TextDirection.rtl,
                              "『 إِنَّ ٱلصَّلَاةَ كَانَتْ عَلَى ٱلْمُؤْمِنِينَ كِتَابًا مَوْقُوتًا 』\n﴿ صَدَقَ اللهُ العَظِيمْ ﴾",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        //sizedbox
                        SizedBox(
                          height: Sizeconfig.screenheight! / 150,
                        ),

                        //Current Pray Time card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 04),
                          child: SizedBox(
                            height: Sizeconfig.screenheight! < 768
                                ? Sizeconfig.screenheight! / 2.7
                                : Sizeconfig.screenheight! > 1024
                                    ? Sizeconfig.screenheight! / 4.3
                                    : Sizeconfig.screenheight! / 3.5,
                            child: CurrentPrayTime(
                              mawaqitTextColor: Colors.white,
                              textcolor2: Colors.white,
                              textcolor: kmaincolor4,
                              elevation: 0,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),

                        //Prayer times table
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 08),
                          child: Prayertimestable(),
                        ),

                        //sizedbox
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
