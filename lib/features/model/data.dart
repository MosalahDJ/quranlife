import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyData extends GetxController {
  Map<dynamic, dynamic> prayerData = {};
  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    String? responsebody = prefs.getString("responsebody");
    if (responsebody != null) {
      try {
        prayerData = jsonDecode(responsebody);
      } catch (e) {
        print("$e");
      }
    }
  }
}
