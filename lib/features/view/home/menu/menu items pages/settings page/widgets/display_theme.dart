import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/settings_type.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';

class DisplayThemePage extends StatelessWidget {
  const DisplayThemePage({super.key});

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
            child: Settingtype(title: "theme_mode".tr, listwidget: [
              _buildThemeOption(AppTheme.system, 'system_theme'.tr),
              _buildThemeOption(AppTheme.light, 'light_theme'.tr),
              _buildThemeOption(AppTheme.dark, 'dark_theme'.tr),
            ]),
          )
        ]));
  }
}

Widget _buildThemeOption(AppTheme theme, String title) {
  final ThemeController themctrl = Get.find();
  final LanguageController langCtrl = Get.find();
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
