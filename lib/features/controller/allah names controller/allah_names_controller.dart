import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/model/allahnames.dart';

class AllahNamesController extends GetxController {
  List<AllhaNames> allahNames = [];

  // Initialize controller and load allahNames data
  @override
  void onInit() async {
    super.onInit();
    await loadAllahNamesData();
  }

  // Fetch AllahNames data from JSON file
  Future<List<AllhaNames>> fetchAllahNamesData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/names_of_allah.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => AllhaNames.fromJson(json)).toList();
  }

  // Load AllahNames data and update UI
  Future<void> loadAllahNamesData() async {
    allahNames = await fetchAllahNamesData();
    update();
  }
}
