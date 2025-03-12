import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class QuraanicSupplicationController extends GetxController {
  List<IslamicTeachingModel> quraanicSupplication = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadQuraanicSupplicationData();
  }

  // Fetch QuraanicSupplication data from JSON file
  Future<List<IslamicTeachingModel>> fetchQuraanicSupplicationData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/quraanicsuplication.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load QuraanicSupplication data and update UI
  Future<void> loadQuraanicSupplicationData() async {
    quraanicSupplication = await fetchQuraanicSupplicationData();
    update();
  }
}
