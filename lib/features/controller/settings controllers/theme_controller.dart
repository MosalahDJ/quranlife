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
  // استخدام RxBool لتتبع حالة الوضع المظلم
  final RxBool isDarkModeRx = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeTheme();
  }

  // تهيئة سمة التطبيق
  Future<void> initializeTheme() async {
    prefs = await SharedPreferences.getInstance();
    // قراءة AppTheme.values من SharedPreferences
    String? savedTheme = prefs.getString('theme');
    // إذا لم تكن فارغة، قم بتعيين selectedTheme = savedTheme
    if (savedTheme != null) {
      selectedTheme.value = AppTheme.values.firstWhere(
        (e) => e.toString() == savedTheme,
        // إذا كانت فارغة، استخدم AppTheme.system كقيمة
        orElse: () => AppTheme.system,
      );
    }

    // تعيين حالة الوضع المظلم الأولية
    _updateDarkModeState();
    
    // تطبيق السمة
    _applyTheme();
    
    // إضافة هذا: تحديث إجباري لجميع الواجهات المدارة بواسطة GetX
    update();
  }

  // الحصول على قيمة currentTheme عند البدء
  ThemeData get currentTheme {
    if (selectedTheme.value == AppTheme.system) {
      return Get.isPlatformDarkMode ? Themes().darkmode : Themes().lightmode;
    }
    return selectedTheme.value == AppTheme.light
        ? Themes().lightmode
        : Themes().darkmode;
  }
  
  // الحصول على ThemeMode الحالي
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

  // دالة للتحقق مما إذا كنا في الوضع المظلم
  bool get isDarkMode => isDarkModeRx.value;

  // تحديث حالة تتبع الوضع المظلم
  void _updateDarkModeState() {
    final newDarkModeState = (selectedTheme.value == AppTheme.dark) || 
                           (selectedTheme.value == AppTheme.system && Get.isPlatformDarkMode);
    
    // تحديث فقط إذا تغيرت القيمة لتجنب إعادة البناء غير الضرورية
    if (isDarkModeRx.value != newDarkModeState) {
      isDarkModeRx.value = newDarkModeState;
    }
  }

  // دالة لتغيير السمة وحفظها في SharedPreferences
  // تستخدم في صفحة الإعدادات للتغيير اليدوي
  void changeTheme(AppTheme theme) async {
    // تحديث السمة المحددة
    selectedTheme.value = theme;
    await prefs.setString('theme', theme.toString());
    
    // تحديث حالة الوضع المظلم
    _updateDarkModeState();
    
    // تطبيق السمة
    _applyTheme();
    
    // تحديث إجباري لإعادة بناء التطبيق مع السمة الجديدة
    update();
    Get.forceAppUpdate();
  }

  // دالة مساعدة لتطبيق السمة
  void _applyTheme() {
    // تعيين كل من بيانات السمة ووضع السمة
    Get.changeTheme(currentTheme);
    Get.changeThemeMode(currentThemeMode);
  }
}