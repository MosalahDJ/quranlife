import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class IslamicruqyaController extends GetxController {
  List<IslamicTeachingModel> islamicruqya = [];

  // Initialize controller and load islamicruqya data
  @override
  void onInit() async {
    super.onInit();
    await loadIslamicruqyaData();
  }

  // Fetch Islamicruqya data from JSON file
  Future<List<IslamicTeachingModel>> fetchIslamicruqyaData() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/assets/json/islamicruqya.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load Islamicruqya data and update UI
  Future<void> loadIslamicruqyaData() async {
    islamicruqya = await fetchIslamicruqyaData();
    update();
  }
}
