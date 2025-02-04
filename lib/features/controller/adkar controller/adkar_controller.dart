import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/model/adhkardata.dart';

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
    update();
  }
}
