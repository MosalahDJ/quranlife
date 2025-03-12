import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/allahnames.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllahNamesController extends GetxController {
  List<AllhaNames> allahNames = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadAllahNamesData();
    loadAndUpdateDailyHadith();
  }

  // Fetch AllahNames data from JSON file
  Future<List<AllhaNames>> fetchAllahNamesData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/names_of_allah.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => AllhaNames.fromJson(json)).toList();
  }

  // Load AllahNames data and update UI
  Future<void> loadAllahNamesData() async {
    allahNames = await fetchAllahNamesData();
    update();
  }

  //daily name
  final Random _random = Random();
  final Rx<Map<String, dynamic>> dailyname = Rx<Map<String, dynamic>>({});
  static const String lastupdatedkey = 'last_daily_name_update';
  static const String dailynamekey = 'daily_name';

  int getRandomInRange(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }

  Map<String, dynamic> getrandomName() {
    final randomnameIndex = getRandomInRange(0, allahNames.length - 1);
    final randomname = allahNames[randomnameIndex];

    return {
      'name': randomname.name,
      'nameText': randomname.text,
    };
  }

  Future<void> loadAndUpdateDailyHadith() async {
    final prefs = await SharedPreferences.getInstance();
    final lastnameUpdate = prefs.getInt(lastupdatedkey) ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    // Check if 24 hours have passed
    if (now - lastnameUpdate >= 24 * 60 * 60 * 1000) {
      // Generate new daily name
      dailyname.value = getrandomName();

      // Save new name and update time
      await prefs.setInt(lastupdatedkey, now);
    } else {
      // Load existing daily name
      final savedname = prefs.getString(dailynamekey);
      if (savedname != null) {
        dailyname.value = json.decode(savedname);
      } else {
        dailyname.value = getrandomName();
        await prefs.setString(dailynamekey, json.encode(dailyname.value));
      }
    }
  }
}
