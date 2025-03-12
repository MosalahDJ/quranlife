import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/islamic_teaching.dart';

class GhuslController extends GetxController {
  List<IslamicTeachingModel> ghuslTeaching = [];

  // Initialize controller and load GhuslController data
  @override
  void onInit() async {
    super.onInit();
    await loadghuslTeachingData();
  }

  // Fetch ghuslTeaching data from JSON file
  Future<List<IslamicTeachingModel>> fetchGhuslTeachingData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/ghusl.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => IslamicTeachingModel.fromJson(json)).toList();
  }

  // Load ghuslTeaching data and update UI
  Future<void> loadghuslTeachingData() async {
    ghuslTeaching = await fetchGhuslTeachingData();
    update();
  }
}
