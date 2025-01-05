import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/view/home/quraan%20page/widgets/ayah_view_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/widgets/juzua_view_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/widgets/surah_view_page.dart';
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
            title: Text(
              "holy_quran".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),

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
