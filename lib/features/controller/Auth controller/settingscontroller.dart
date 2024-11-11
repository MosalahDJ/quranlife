import 'package:get/get.dart';
import 'package:quranlife/core/Utils/thems.dart';

class Settingscontroller extends GetxController {
  bool val = Get.isPlatformDarkMode ? true : false;

  myswitch(value) {
    if (Get.isDarkMode) {
      Get.changeTheme(Themes().lightmode);
      update();
    } else {
      Get.changeTheme(Themes().darkmode);
      update();
    }
    val = !val;
  }
}
