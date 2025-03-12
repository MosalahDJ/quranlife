import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class PraiseController extends GetxController {
  List<IslamicTeachingModel> praiseController = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadPraiseControllerData();
  }

  // Fetch PraiseController data from JSON file
  Future<List<IslamicTeachingModel>> fetchPraiseControllerData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/praise.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load PraiseController data and update UI
  Future<void> loadPraiseControllerData() async {
    praiseController = await fetchPraiseControllerData();
    update();
  }
}
