import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/view/home/Drawer%20page/my_drawer.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/categories.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/salawat_pageview.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/cart_card.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/wirds.dart';
import 'package:quranlife/core/widgets/cusstom_indicator.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({
    super.key,
  });
  final MyHomeController homectrl = Get.find();
  final GoogleSignoutController signoutctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Stack(children: [
          //gradient background
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),

          //foreground
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // salawat pageview
                    SalawatPageview(),

                    //dots indicators
                    /*I pass the color here because it doesn't chage in the real
                    time when i change the theme if the bool Get.isDarkMode isn't 
                    in the mainfile of page (not of preject it's of page 
                    Like this page 'homepage').
                    that problem take a few time of me.
                    */
                    Container(
                      alignment: Alignment.center,
                      child: GetBuilder<MyHomeController>(
                        builder: (c) => CustomIndicator(
                          dotscolor: Get.isDarkMode
                              ? const Color(0xffFD9B63)
                              : kmaincolor,
                          dotscount: 2,
                          indposition: homectrl.homepagecontroller.page != null
                              ? homectrl.homepagecontroller.page!.toInt()
                              : 0,
                        ),
                      ),
                    ),

                    //categories widgets
                    const ServiceCategorie(),
                    SizedBox(
                      height: Sizeconfig.screenheight! / 100,
                    ),

                    // nearset mosque to you
                    Text("nearset mosque to you",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: Sizeconfig.screenheight! / 100,
                    ),
                    SizedBox(
                        height: Sizeconfig.screenheight! < 768
                            ? Sizeconfig.screenheight! / 3.7
                            : Sizeconfig.screenheight! > 1010
                                ? Sizeconfig.screenheight! / 6
                                : Sizeconfig.screenheight! / 5,
                        child: CartCard(
                          elevation: 2,
                          color: Get.isDarkMode
                              ? kmaincolor2dark.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                        )),
                    SizedBox(
                      height: Sizeconfig.screenheight! / 100,
                    ),

                    // The daily Wird cards
                    Text("The Daily 'Wirds'",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: Sizeconfig.screenheight! / 100,
                    ),
                    Wirds(
                      mycolor: Get.isDarkMode
                          ? kmaincolor2dark.withOpacity(0.5)
                          : Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
