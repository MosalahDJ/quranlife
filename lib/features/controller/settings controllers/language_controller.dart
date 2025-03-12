import 'dart:ui';

import 'package:get/get.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final language = 'ar'.obs;
  final SharedPreferences prefs;
  ThemeController themeController = Get.find();

  LanguageController(this.prefs) {
    language.value = prefs.getString('language') ?? 'ar';
  }

  void changeLanguage(String lng) async {
    language.value = lng;
    await prefs.setString('language', lng);
    Get.updateLocale(Locale(lng));
  }
}
