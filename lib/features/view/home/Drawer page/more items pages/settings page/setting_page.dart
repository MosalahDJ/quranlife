import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/notfication%20controller/work_manager_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final WorkManagerController wkmctrl = Get.find();
  final ThemeController themctrl = Get.find();
  final LanguageController langCtrl = Get.find();

  Widget _buildThemeOption(AppTheme theme, String title) {
    return Obx(() => RadioListTile<AppTheme>(
          title: Text(title),
          value: theme,
          groupValue: themctrl.selectedTheme.value,
          onChanged: (value) {
            themctrl.changeTheme(value!);
            Get.updateLocale(Locale(langCtrl.language.value));
            themctrl.initializeTheme();
          },
          activeColor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          controlAffinity: ListTileControlAffinity.trailing,
        ));
  }

  Widget _buildLanguageOption(String lang, String title) {
    return Obx(() => RadioListTile<String>(
          title: Text(title),
          value: lang,
          groupValue: langCtrl.language.value,
          onChanged: (value) {
            langCtrl.changeLanguage(value!);
            Get.updateLocale(Locale(value));
            // Force theme refresh when language changes
            themctrl.changeTheme(themctrl.selectedTheme.value);
          },
          activeColor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          controlAffinity: ListTileControlAffinity.trailing,
        ));
  }

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
            Settingtype(title: "theme_mode".tr, listwidget: [
              _buildThemeOption(AppTheme.system, 'system_theme'.tr),
              _buildThemeOption(AppTheme.light, 'light_theme'.tr),
              _buildThemeOption(AppTheme.dark, 'dark_theme'.tr),
            ]),
            // Add language settings section
            Settingtype(
              title: "Language",
              listwidget: [
                _buildLanguageOption('ar', 'arabic'.tr),
                _buildLanguageOption('en', 'english'.tr),
                _buildLanguageOption('fr', 'french'.tr),
              ],
            ),
            Settingtype(
              title: 'notifications'.tr,
              listwidget: [
                //adhan
                Obx(() => SwitchListTile(
                    title: Text('adhan_notifications'.tr,
                        style: const TextStyle(fontSize: 15)),
                    value: wkmctrl.adhansubscribition.value,
                    onChanged: (val) {
                      wkmctrl.adhansubscribition.value =
                          !wkmctrl.adhansubscribition.value;
                      wkmctrl.onChangeSubscription(NotificationType.adhan, val);
                    })),
                //adkhar
                Obx(() => SwitchListTile(
                    title: Text('adhkar_notifications'.tr,
                        style: const TextStyle(fontSize: 15)),
                    value: wkmctrl.adhkarsubscribition.value,
                    onChanged: (val) {
                      wkmctrl.adhkarsubscribition.value =
                          !wkmctrl.adhkarsubscribition.value;
                      wkmctrl.onChangeSubscription(
                          NotificationType.adhkar, val);
                    })),
                //quraan
                Obx(() => SwitchListTile(
                    title: Text('quran_notifications'.tr,
                        style: const TextStyle(fontSize: 15)),
                    value: wkmctrl.quraansubscribition.value,
                    onChanged: (val) {
                      wkmctrl.quraansubscribition.value =
                          !wkmctrl.quraansubscribition.value;
                      wkmctrl.onChangeSubscription(
                          NotificationType.quraan, val);
                    })),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

//Settings List Tile

class Settingtype extends StatelessWidget {
  const Settingtype({super.key, required this.title, required this.listwidget});
  final String title;

  final List<Widget> listwidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        Column(children: listwidget),
      ],
    );
  }
}
