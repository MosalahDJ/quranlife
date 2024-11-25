import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/thems.dart';

enum AppTheme { light, dark, system }

class Settingscontroller extends GetxController {
  var selectedTheme = AppTheme.system.obs;
  RxBool isdevicethemedark = false.obs;

  devicetheme(BuildContext context) {
    Brightness devicetheme = MediaQuery.of(context).platformBrightness;
    devicetheme == Brightness.dark ? isdevicethemedark = true.obs : false.obs;
  }

  ThemeData get currentTheme {
    return selectedTheme.value == AppTheme.light
        ? Themes().lightmode
        : selectedTheme.value == AppTheme.system
            ? isdevicethemedark.value
                ? Themes().darkmode
                : Themes().lightmode
            : Themes().darkmode;
  }

  void changeTheme(AppTheme theme) {
    selectedTheme.value = theme;
    Get.changeTheme(theme == AppTheme.system
        ? isdevicethemedark.value
            ? Themes().darkmode
            : Themes().lightmode
        : theme == AppTheme.light
            ? Themes().lightmode
            : Themes().darkmode);
    update();
  }
}
