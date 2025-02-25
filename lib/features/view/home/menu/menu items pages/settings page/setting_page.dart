import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/settings_type.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Settings appbar
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'settings'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kmaincolor,
      ),

      //Settings body
      body: GetBuilder<ThemeController>(
        builder: (c) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            //themedata list tile
            Settingtype(title: "theme_mode".tr, listwidget: const []),
            // Add language settings section
            Settingtype(
              title: "Language".tr,
              listwidget: const [],
            ),
            Settingtype(
              title: 'notifications'.tr,
              listwidget: const [],
            ),
          ]),
        ),
      ),
    );
  }
}

//Settings List Tile
