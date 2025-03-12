import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/features/model/adhkardata.dart';

class AdkarController extends GetxController {
  List<Adkar> adkar = [];
  RxList<Adkar> filteredAdkar = <Adkar>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await loadAdkarData();
  }

  Future<void> loadAdkarData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/adhkar.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    adkar = jsonList.map((json) => Adkar.fromJson(json)).toList();
    update();
  }

  void filterAdkarBySection(int sectionId) {
    filteredAdkar.value =
        adkar.where((duaa) => duaa.sectionId == sectionId).toList();
    // Store original count values when filtering
    for (var duaa in filteredAdkar) {
      duaa.originalCount = duaa.count;
    }
    update();
  }

  void resetDuaaCounts() {
    for (var duaa in filteredAdkar) {
      // Reset count to its original value from JSON
      duaa.count = duaa.originalCount;
    }
    update();
  }
}
