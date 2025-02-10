import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/model/teatchingprayermodel.dart';

class TeachingPrayerController extends GetxController {
  List<Teatchingprayermodel> teachingprayer = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadTeachingPrayerData();
  }

  // Fetch TeachingPrayer data from JSON file
  Future<List<Teatchingprayermodel>> fetchTeachingPrayerData() async {
    String jsonString = await rootBundle
        .loadString('lib/core/assets/json/teatchingprayer.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Teatchingprayermodel.fromJson(json)).toList();
  }

  // Load Teachingprayer data and update UI
  Future<void> loadTeachingPrayerData() async {
    teachingprayer = await fetchTeachingPrayerData();
    update();
  }
}
