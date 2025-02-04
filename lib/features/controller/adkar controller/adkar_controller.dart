import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/model/adhkardata.dart';

class AdkarController extends GetxController {
  List<Adkar> adkar = [];

  // Initialize controller and load adkar data
  @override
  void onInit() async {
    super.onInit();
    await loadAdkarData();
  }

  // Fetch adkar data from JSON file
  Future<List<Adkar>> fetchAdkarData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/adhkar.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Adkar.fromJson(json)).toList();
  }

  // Load adkar data and update UI
  Future<void> loadAdkarData() async {
    adkar = await fetchAdkarData();
    update();
  }
}
