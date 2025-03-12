import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class SeekingForgivnesController extends GetxController {
  List<IslamicTeachingModel> seekingForgivnes = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadSeekingForgivnesData();
  }

  // Fetch SeekingForgivnes data from JSON file
  Future<List<IslamicTeachingModel>> fetchSeekingForgivnesData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/seekingforgivnes.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load SeekingForgivnes data and update UI
  Future<void> loadSeekingForgivnesData() async {
    seekingForgivnes = await fetchSeekingForgivnesData();
    update();
  }
}
