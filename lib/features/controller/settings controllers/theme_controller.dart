import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/thems.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeController extends GetxController {
  var selectedTheme = AppTheme.dark.obs;

  ThemeData get currentTheme {
    return selectedTheme.value == AppTheme.light
        ? Themes().lightmode
        : Themes().darkmode;
  }

  void changeTheme(AppTheme theme) {
    selectedTheme.value = theme;
    Get.changeTheme(
        theme == AppTheme.light ? Themes().lightmode : Themes().darkmode);
    update();
  }
}
