import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class HajController extends GetxController {
  List<IslamicTeachingModel> hajdata = [];

  // Initialize controller and load haj data
  @override
  void onInit() async {
    super.onInit();
    await loadhajData();
  }

  // Fetch haj data from JSON file
  Future<List<IslamicTeachingModel>> fetchhajData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/haj.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load haj data and update UI
  Future<void> loadhajData() async {
    hajdata = await fetchhajData();
    update();
  }
}
