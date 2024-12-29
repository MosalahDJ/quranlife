import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final language = 'en'.obs;
  final SharedPreferences prefs;

  LanguageController(this.prefs) {
    language.value = prefs.getString('language') ?? 'en';
  }

  void changeLanguage(String lng) {
    language.value = lng;
    prefs.setString('language', lng);
    Get.updateLocale(Locale(lng));
  }
}
