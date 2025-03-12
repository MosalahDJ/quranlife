import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class TeachingPrayerController extends GetxController {
  List<IslamicTeachingModel> teachingprayer = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadTeachingPrayerData();
  }

  // Fetch TeachingPrayer data from JSON file
  Future<List<IslamicTeachingModel>> fetchTeachingPrayerData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/teatchingprayer.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load Teachingprayer data and update UI
  Future<void> loadTeachingPrayerData() async {
    teachingprayer = await fetchTeachingPrayerData();
    update();
  }
}
