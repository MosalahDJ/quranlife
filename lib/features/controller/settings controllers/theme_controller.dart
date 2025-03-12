import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/theme/thems.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme {
  light,
  dark,
  system,
}

class ThemeController extends GetxController {
  var selectedTheme = AppTheme.system.obs;
  late SharedPreferences prefs;
  final RxBool isDarkModeRx = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeTheme();
  }

  Future<void> initializeTheme() async {
    prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme');

    if (savedTheme != null) {
      selectedTheme.value = AppTheme.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => AppTheme.system,
      );
    }

    _updateDarkModeState();

    // تأكد من تطبيق السمة بشكل متزامن
    await _applyTheme();

    // إضافة تأخير صغير لضمان تطبيق السمة بشكل صحيح
    await Future.delayed(const Duration(milliseconds: 100));
    update();
  }

  ThemeData get currentTheme {
    final themes = Themes();
    if (selectedTheme.value == AppTheme.system) {
      return Get.isPlatformDarkMode ? themes.darkmode : themes.lightmode;
    }
    return selectedTheme.value == AppTheme.light
        ? themes.lightmode
        : themes.darkmode;
  }

  ThemeMode get currentThemeMode {
    switch (selectedTheme.value) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
      return ThemeMode.system;
    }
  }

  bool get isDarkMode => isDarkModeRx.value;

  void _updateDarkModeState() {
    final newDarkModeState = (selectedTheme.value == AppTheme.dark) ||
        (selectedTheme.value == AppTheme.system && Get.isPlatformDarkMode);

    if (isDarkModeRx.value != newDarkModeState) {
      isDarkModeRx.value = newDarkModeState;
    }
  }

  Future<void> changeTheme(AppTheme theme) async {
    selectedTheme.value = theme;
    await prefs.setString('theme', theme.toString());

    _updateDarkModeState();

    // جعل تطبيق السمة متزامن
    await _applyTheme();

    update();
    Get.forceAppUpdate();
  }

  Future<void> _applyTheme() async {
    final newTheme = currentTheme;
    final newThemeMode = currentThemeMode;

    // تطبيق السمة بشكل متزامن
    Get.changeTheme(newTheme);
    Get.changeThemeMode(newThemeMode);

    // إضافة تأخير صغير لضمان تطبيق السمة
    await Future.delayed(const Duration(milliseconds: 50));
  }
}
