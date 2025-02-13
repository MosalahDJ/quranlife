import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/model/ahadith_data.dart';

class AhadithController extends GetxController {
  List<AhadithData> ahadith = [];

  // Initialize controller and load ahadithController data
  @override
  void onInit() async {
    super.onInit();
    await loadAhadithData();
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
}
