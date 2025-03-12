import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/ahadith_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AhadithController extends GetxController {
  List<AhadithData> ahadith = [];

  // Initialize controller and load ahadithController data
  @override
  void onInit() async {
    super.onInit();
    await loadAhadithData();
    loadAndUpdateDailyHadith();
  }

  // Fetch Ahadith data from JSON file
  Future<List<AhadithData>> fetchAhadithData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/ahadit.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((hadith) => AhadithData.fromJson(hadith)).toList();
  }

  // Load Ahadith data and update UI
  Future<void> loadAhadithData() async {
    ahadith = await fetchAhadithData();
    update();
  }

  //daily Hadith
  final Random _random = Random();
  final Rx<Map<String, dynamic>> dailyHadith = Rx<Map<String, dynamic>>({});
  static const String lastupdatedkey = 'last_daily_hadith_update';
  static const String dailyHadithkey = 'daily_Hadith';

  int getRandomInRange(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }

  Map<String, dynamic> getrandomHadith() {
    final randomhadithIndex = getRandomInRange(0, ahadith.length - 1);
    final randomhadith = ahadith[randomhadithIndex];

    return {
      'Hadithtitle': randomhadith.titleAr,
      'Hadithsource': randomhadith.sourceAr,
      'Hadithtext': randomhadith.textAr,
      'Hadithnarator': randomhadith.narratorAr,
    };
  }

  Future<void> loadAndUpdateDailyHadith() async {
    final prefs = await SharedPreferences.getInstance();
    final lasthadithUpdate = prefs.getInt(lastupdatedkey) ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    // Check if 24 hours have passed
    if (now - lasthadithUpdate >= 24 * 60 * 60 * 1000) {
      // Generate new daily ayah
      dailyHadith.value = getrandomHadith();

      // Save new ayah and update time
      await prefs.setInt(lastupdatedkey, now);
    } else {
      // Load existing daily ayah
      final savedHadith = prefs.getString(dailyHadithkey);
      if (savedHadith != null) {
        dailyHadith.value = json.decode(savedHadith);
      } else {
        dailyHadith.value = getrandomHadith();
        await prefs.setString(dailyHadithkey, json.encode(dailyHadith.value));
      }
    }
  }
}
