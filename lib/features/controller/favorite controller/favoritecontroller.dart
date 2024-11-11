import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List favoritelist = [
    "beans",
    "dairy",
    "meat",
    "chikens",
    "drinks",
    "oils",
    "beans",
    "dairy",
    "meat",
    "chikens",
    "drinks",
    "oils",
  ];
  removeitem(index) {
    favoritelist.removeAt(index);
    Get.back();
    update();
  }
}
