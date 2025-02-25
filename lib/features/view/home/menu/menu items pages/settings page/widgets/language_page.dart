import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/settings_type.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: ShimmerText(
            text: 'islamic_ruqyah'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(children: [
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          SafeArea(
            child: Settingtype(
              title: "Language",
              listwidget: [
                _buildLanguageOption('ar', 'arabic'.tr),
                _buildLanguageOption('en', 'english'.tr),
                _buildLanguageOption('fr', 'french'.tr),
              ],
            ),
          )
        ]));
  }
}

Widget _buildLanguageOption(String lang, String title) {
  final ThemeController themctrl = Get.find();
  final LanguageController langCtrl = Get.find();
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
