import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/view/home/quraan%20page/saved%20ayahs/saved_ayahs.dart';
import 'package:quranlife/features/view/home/quraan%20page/ayah_view_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/juzua_view_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/surah_view_page.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class QuraanPage extends StatelessWidget {
  QuraanPage({super.key});

  final MyHomeController homectrl = Get.find();
  final GoogleSignoutController signoutctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          //appbar

          appBar: AppBar(
            centerTitle: true,
            backgroundColor: kmaincolor,
            title: ShimmerText(
              text: "holy_quran".tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => SavedAyahs());
                      },
                      icon: const Icon(
                        Icons.bookmarks,
                        color: Colors.white,
                      ))),
            ],

            //TabBar

            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: kmaincolor4,
                indicatorColor: kmaincolor4,
                dividerColor: kmaincolor,
                tabs: [
                  Tab(
                    icon: const Icon(FlutterIslamicIcons.quran),
                    child: Text("surah".tr),
                  ),
                  Tab(
                    icon: const Icon(FlutterIslamicIcons.quran),
                    child: Text("juz".tr),
                  ),
                  Tab(
                    icon: const Icon(FlutterIslamicIcons.quran),
                    child: Text("verse".tr),
                  ),
                ]),
          ),

          //Body

          body: TabBarView(children: [
            Surahviewpage(
              backround: Gradientbackground(
                gradientcolor: [
                  kmaincolor,
                  Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
                ],
              ),
            ),
            JuzuaViewPage(
              backround: Gradientbackground(
                gradientcolor: [
                  kmaincolor,
                  Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
                ],
              ),
            ),
            AyahViewPage(
              backround: Gradientbackground(
                gradientcolor: [
                  kmaincolor,
                  Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
                ],
              ),
            ),
          ])),
    );
  }
}
