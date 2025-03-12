import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/adkar_type_data.dart';

class AdkarCategoriesController extends GetxController {
  List<AdkarTypes> adkartype = [];

  // Initialize controller and load adkartype data
  @override
  void onInit() async {
    super.onInit();
    await loadAdkarTypeData();
  }

  // Fetch adkartype data from JSON file
  Future<List<AdkarTypes>> fetchAdkarTypeData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/adkartype.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => AdkarTypes.fromJson(json)).toList();
  }

  // Load adkartype data and update UI
  Future<void> loadAdkarTypeData() async {
    adkartype = await fetchAdkarTypeData();
    update();
  }
}
