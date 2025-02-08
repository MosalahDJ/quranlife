import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/view/home/adkar%20page/adkar_page.dart';
import 'package:quranlife/features/view/home/categories_page/categories_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/quraan_page.dart';
import 'package:quranlife/features/view/home/home%20page/home_page_body.dart';
import 'package:quranlife/features/view/home/profile/profile_page.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<MyHomeController>(
          builder: (controller) => FlashyTabBar(
                selectedIndex: homectrl.selected,
                backgroundColor: kmaincolor,
                showElevation: true,
                animationCurve: Curves.easeInOutCubic,
                animationDuration: const Duration(seconds: 1),
                iconSize: 30,
                onItemSelected: (value) {
                  homectrl.bnbfunc(value);
                },
                items: [
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.person_rounded,
                    ),
                    title: Text(
                      'more'.tr,
                      textAlign: TextAlign.center,
                    ),
                    activeColor: kmaincolor4,
                    inactiveColor: Colors.white,
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.dashboard_rounded,
                    ),
                    title: Text(
                      'category'.tr,
                      textAlign: TextAlign.center,
                    ),
                    activeColor: kmaincolor4,
                    inactiveColor: Colors.white,
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      FlutterIslamicIcons.mosque,
                    ),
                    title: Text(
                      'home'.tr,
                      textAlign: TextAlign.center,
                    ),
                    activeColor: kmaincolor4,
                    inactiveColor: Colors.white,
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      FlutterIslamicIcons.tasbih3,
                    ),
                    title: Text(
                      'adkar'.tr,
                      textAlign: TextAlign.center,
                    ),
                    activeColor: kmaincolor4,
                    inactiveColor: Colors.white,
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      FlutterIslamicIcons.solidQuran2,
                    ),
                    title: Text('quran'.tr),
                    activeColor: kmaincolor4,
                    inactiveColor: Colors.white,
                  ),
                ],
              )),
      body: GetBuilder<MyHomeController>(
        builder: (controller) {
          return IndexedStack(
            index: homectrl.selected,
            children: [
              ProfilePage(),
              const CategoriesPage(),
              HomePageBody(),
              const AdkarPage(),
              QuraanPage(),
            ],
          );
        },
      ),
    );
  }
}
