import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class OmraController extends GetxController {
  List<IslamicTeachingModel> omradata = [];

  // Initialize controller and load omradata data
  @override
  void onInit() async {
    super.onInit();
    await loadomraData();
  }

  // Fetch omra data from JSON file
  Future<List<IslamicTeachingModel>> fetchomraData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/omra.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load omra data and update UI
  Future<void> loadomraData() async {
    omradata = await fetchomraData();
    update();
  }
}
