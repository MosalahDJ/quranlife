import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class ProphetsSupplicationController extends GetxController {
  List<IslamicTeachingModel> prophetsSupplication = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadProphetsSupplicationData();
  }

  // Fetch ProphetsSupplication data from JSON file
  Future<List<IslamicTeachingModel>> fetchProphetsSupplicationData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/prophets_supplication.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load ProphetsSupplication data and update UI
  Future<void> loadProphetsSupplicationData() async {
    prophetsSupplication = await fetchProphetsSupplicationData();
    update();
  }
}
