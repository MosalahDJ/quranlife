import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class WuduController extends GetxController {
  List<IslamicTeachingModel> wuduTeaching = [];

  // Initialize controller and load wuduteaching data
  @override
  void onInit() async {
    super.onInit();
    await loadWuduTeachingData();
  }

  // Fetch WuduTeaching data from JSON file
  Future<List<IslamicTeachingModel>> fetchWuduTeachingData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/wudu.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load WuduTeaching data and update UI
  Future<void> loadWuduTeachingData() async {
    wuduTeaching = await fetchWuduTeachingData();
    update();
  }
}
