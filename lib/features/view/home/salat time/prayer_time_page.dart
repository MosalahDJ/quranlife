import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/currunet_pray_time.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/prayer_times_table.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/salat_timebar.dart';

class PrayerTimesPage extends StatelessWidget {
  const PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizeconfig.screenheight,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const AssetImage(
              "lib/core/assets/images/background_image/newbackground.jpg"),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Sizeconfig.screenheight! * 0.02,
                  horizontal: Sizeconfig.screenwidth! * 0.04,
                ),
                child: Column(
                  children: [
                    const Salattimebar(),

                    SizedBox(height: Sizeconfig.screenheight! * 0.03),

                    // Quran Verse Card
                    Card(
                      color: Colors.transparent,
                      child: Container(
                        width: Sizeconfig.screenwidth,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.1)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const ShimmerText(
                          text:
                              "\uFD3F  إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا \uFD3E \nصَدَقَ اللهُ العَظِيم",
                          textalign: TextAlign.center,
                          textdirection: TextDirection.rtl,
                          begin: 2,
                          end: -2,
                          color: Color(0xFFFFD700),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            fontFamily: 'Amiri', // Add an Arabic font
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Sizeconfig.screenheight! * 0.03),

                    // Current Prayer Time Card


                       CurrentPrayTime(
                        morebuttoncolor: Colors.white,
                        onpressed: () {},
                        moreIconVisibility: false,
                        textcolor2: Colors.white,
                        textcolor: kmaincolor4,
                        elevation: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),


                    SizedBox(height: Sizeconfig.screenheight! * 0.03),

                    // Prayer Times Table
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Prayertimestable(),
                    ),

                    SizedBox(height: Sizeconfig.screenheight! * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
