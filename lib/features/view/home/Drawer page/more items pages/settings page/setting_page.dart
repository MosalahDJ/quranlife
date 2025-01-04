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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          //themedata list tile
          Settingtype(title: "theme_mode".tr, listwidget: [
            Obx(
              () => RadioListTile<AppTheme>(
                title: Text('system_theme'.tr,
                    style: const TextStyle(fontSize: 15)),
                value: AppTheme.system,
                groupValue: themctrl.selectedTheme.value,
                onChanged: (value) {
                  themctrl.changeTheme(value!);
                  themctrl.initializeTheme();
                },
              ),
            ),
            Obx(
              () => RadioListTile<AppTheme>(
                title: Text('light_theme'.tr,
                    style: const TextStyle(fontSize: 15)),
                value: AppTheme.light,
                groupValue: themctrl.selectedTheme.value,
                onChanged: (value) {
                  themctrl.changeTheme(value!);
                  themctrl.initializeTheme();
                },
              ),
            ),
            Obx(
              () => RadioListTile<AppTheme>(
                title:
                    Text('dark_theme'.tr, style: const TextStyle(fontSize: 15)),
                value: AppTheme.dark,
                groupValue: themctrl.selectedTheme.value,
                onChanged: (value) {
                  themctrl.changeTheme(value!);
                  themctrl.initializeTheme();
                },
              ),
            ),
          ]),
          // Add language settings section
          Settingtype(
            title: "Language",
            listwidget: [
              Obx(
                () => RadioListTile<String>(
                  title: Text(
                    'arabic'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  value: 'ar',
                  groupValue: langCtrl.language.value,
                  onChanged: (value) {
                    langCtrl.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                    themctrl.initializeTheme();
                  },
                ),
              ),
              Obx(
                () => RadioListTile<String>(
                  title: Text(
                    'english'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  value: 'en',
                  groupValue: langCtrl.language.value,
                  onChanged: (value) {
                    langCtrl.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                    themctrl.initializeTheme();
                  },
                ),
              ),
              Obx(
                () => RadioListTile<String>(
                  title: Text(
                    'french'.tr,
                    style: const TextStyle(fontSize: 15),
                  ),
                  value: 'fr',
                  groupValue: langCtrl.language.value,
                  onChanged: (value) {
                    langCtrl.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                    themctrl.initializeTheme();
                  },
                ),
              ),
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
                    wkmctrl.onChangeSubscription(NotificationType.adhkar, val);
                  })),
              //quraan
              Obx(() => SwitchListTile(
                  title: Text('quran_notifications'.tr,
                      style: const TextStyle(fontSize: 15)),
                  value: wkmctrl.quraansubscribition.value,
                  onChanged: (val) {
                    wkmctrl.quraansubscribition.value =
                        !wkmctrl.quraansubscribition.value;
                    wkmctrl.onChangeSubscription(NotificationType.quraan, val);
                  })),
            ],
          ),
        ]),
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
