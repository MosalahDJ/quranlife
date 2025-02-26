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
  // Add RxBool for dark mode state tracking
  final RxBool isDarkModeRx = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeTheme();
  }

  // Initialize app theme
  Future<void> initializeTheme() async {
    prefs = await SharedPreferences.getInstance();
    // Getting AppTheme.values from SharedPreferences
    String? savedTheme = prefs.getString('theme');
    // If it's not null, set selectedTheme = savedTheme
    if (savedTheme != null) {
      selectedTheme.value = AppTheme.values.firstWhere(
        (e) => e.toString() == savedTheme,
        // If it's null, use AppTheme.system as value
        orElse: () => AppTheme.system,
      );
    }

    // Set initial dark mode state
    _updateDarkModeState();
    
    // Apply theme
    _applyTheme();
    
    // Add this: force update of all GetX managed widgets
    update();
  }

  // Get the value of currentTheme on initial entry
  ThemeData get currentTheme {
    if (selectedTheme.value == AppTheme.system) {
      return Get.isPlatformDarkMode ? Themes().darkmode : Themes().lightmode;
    }
    return selectedTheme.value == AppTheme.light
        ? Themes().lightmode
        : Themes().darkmode;
  }
  
  // Get current ThemeMode
  ThemeMode get currentThemeMode {
    switch (selectedTheme.value) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
      default:
        return ThemeMode.system;
    }
  }

  // Function for checking if we're in dark mode
  bool get isDarkMode => isDarkModeRx.value;

  // Update our dark mode tracking state
  void _updateDarkModeState() {
    final newDarkModeState = (selectedTheme.value == AppTheme.dark) || 
                            (selectedTheme.value == AppTheme.system && Get.isPlatformDarkMode);
    
    // Only update if it changed to avoid unnecessary rebuilds
    if (isDarkModeRx.value != newDarkModeState) {
      isDarkModeRx.value = newDarkModeState;
    }
  }

  // Function for changing the theme and saving it in SharedPreferences
  // Used in setting page for manual changes
  void changeTheme(AppTheme theme) async {
    // Update selected theme
    selectedTheme.value = theme;
    await prefs.setString('theme', theme.toString());
    
    // Update dark mode state
    _updateDarkModeState();
    
    // Apply theme
    _applyTheme();
    
    // Force update to rebuild with new theme
    Get.forceAppUpdate();
    
    // Explicitly notify all widgets
    update();
  }

  // Helper function for applying the theme
  void _applyTheme() {
    // Set both theme data and theme mode
    Get.changeTheme(currentTheme);
    Get.changeThemeMode(currentThemeMode);
  }
}