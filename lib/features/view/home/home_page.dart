import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/view/home/Drawer%20page/my_drawer.dart';
import 'package:quranlife/features/view/home/adkar%20page/adkar_page.dart';
import 'package:quranlife/features/view/home/quraan%20page/quraan_page.dart';
import 'package:quranlife/features/view/home/home%20page/home_page_body.dart';
import 'package:quranlife/features/view/home/profile/profile_page.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      bottomNavigationBar: GetBuilder<MyHomeController>(
          builder: (controller) => CurvedNavigationBar(
                buttonBackgroundColor: kmaincolor4,
                index: homectrl.selected,
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
                color: kmaincolor,
                height: 65,
                onTap: (value) {
                  homectrl.bnbfunc(value);
                },
                items: const [
                  Icon(FlutterIslamicIcons.mosque),
                  Icon(
                    FlutterIslamicIcons.tasbih3,
                  ),
                  Icon(FlutterIslamicIcons.solidQuran2),
                  Icon(Icons.more_vert),
                ],
              )),
      body: GetBuilder<MyHomeController>(
        builder: (controller) {
          return IndexedStack(
            index: homectrl.selected,
            children: [
              HomePageBody(),
              AdkarPage(),
              QuraanPage(),
              ProfilePage(),
            ],
          );
        },
      ),
    );
  }
}
