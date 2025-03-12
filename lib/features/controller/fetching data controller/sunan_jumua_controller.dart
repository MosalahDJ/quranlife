import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class SunanJumuaController extends GetxController {
  List<IslamicTeachingModel> sunanjumua = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadSunanJumuaData();
  }

  // Fetch SunanJumua data from JSON file
  Future<List<IslamicTeachingModel>> fetchSunanJumuaData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/sunanjumua.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load SunanJumua data and update UI
  Future<void> loadSunanJumuaData() async {
    sunanjumua = await fetchSunanJumuaData();
    update();
  }
}
