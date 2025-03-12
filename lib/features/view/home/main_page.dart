import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';
import 'package:project/features/controller/floating_animation_controllers/floating_animation_controller.dart';

import 'package:project/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:project/features/view/home/adkar%20page/adkar_page.dart';
import 'package:project/features/view/home/categories/categories_page.dart';
import 'package:project/features/view/home/home%20page/home_page_body.dart';
import 'package:project/features/view/home/menu/menu_page.dart';
import 'package:project/features/view/home/quraan%20page/quraan_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MyHomeController homectrl = Get.find();
  final FadeAnimationController homefadectrl = Get.put(
    FadeAnimationController(),
  );
  final FloatingAnimationController floatanimctrl = Get.put(
    FloatingAnimationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<MyHomeController>(
        builder:
            (controller) => FlashyTabBar(
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
                  icon: const Icon(Icons.menu_rounded),
                  title: Text(
                    'menu'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                  activeColor: kmaincolor4,
                  inactiveColor: Colors.white,
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.dashboard_rounded),
                  title: Text(
                    'category'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                  activeColor: kmaincolor4,
                  inactiveColor: Colors.white,
                ),
                FlashyTabBarItem(
                  icon: const Icon(FlutterIslamicIcons.mosque),
                  title: Text(
                    'home'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                  activeColor: kmaincolor4,
                  inactiveColor: Colors.white,
                ),
                FlashyTabBarItem(
                  icon: const Icon(FlutterIslamicIcons.tasbih3),
                  title: Text(
                    'adkar'.tr,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  activeColor: kmaincolor4,
                  inactiveColor: Colors.white,
                ),
                FlashyTabBarItem(
                  icon: const Icon(FlutterIslamicIcons.solidQuran2),
                  title: Text(
                    'quran'.tr,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  activeColor: kmaincolor4,
                  inactiveColor: Colors.white,
                ),
              ],
            ),
      ),
      body: GetBuilder<MyHomeController>(
        builder: (controller) {
          return IndexedStack(
            index: homectrl.selected,
            children: [
              const MenuPage(),
              CategoriesPage(),
              HomePageBody(),
              AdkarPage(),
              QuraanPage(),
            ],
          );
        },
      ),
    );
  }
}
