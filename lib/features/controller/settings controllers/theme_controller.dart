import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/theme/thems.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme {
  light,
  dark,
  system,
}

class ThemeController extends GetxController {
  var selectedTheme = AppTheme.system.obs;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    await initializeTheme();
  }

  // initialize app theme
  Future<void> initializeTheme() async {
    prefs = await SharedPreferences.getInstance();
    //getting AppTheme.values from SHPF
    String? savedTheme = prefs.getString('theme');
    //if it not null selectedTheme = savedTheme
    if (savedTheme != null) {
      Get.updateLocale(Locale(prefs.getString('language') ?? 'en'));
      selectedTheme.value = AppTheme.values.firstWhere(
        (e) => e.toString() == savedTheme,
        // if it null use AppTheme.system as value
        orElse: () => AppTheme.system,
      );
    }

    _applyTheme();
  }

  //getting the value of currentTheme in initale entry
  ThemeData get currentTheme {
    if (selectedTheme.value == AppTheme.system) {
      return Get.isPlatformDarkMode ? Themes().darkmode : Themes().lightmode;
    }
    return selectedTheme.value == AppTheme.light
        ? Themes().lightmode
        : Themes().darkmode;
  }

  //func for changing the theme and save it in Shpf then aply it I use it in
  //setting page for changing manually
  void changeTheme(AppTheme theme) async {
    selectedTheme.value = theme;
    await prefs.setString('theme', theme.toString());
    _applyTheme();
    // Force update to rebuild with new font
    Get.forceAppUpdate();
    update();
  }

  //helper func for applying the theme
  void _applyTheme() {
    Get.changeTheme(currentTheme);
  }
}
