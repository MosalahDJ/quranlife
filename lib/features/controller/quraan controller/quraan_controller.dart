import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quranlife/features/model/qurandata.dart';

class QuraanController extends GetxController {
  List<Surah> surahs = [];

  @override
  void onInit() {
    super.onInit();
    loadQuranData();
  }

  Future<List<Surah>> fetchQuranData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/quran.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Surah.fromMap(json)).toList();
  }

  Future<void> loadQuranData() async {
    final data = await fetchQuranData();
    surahs = data;
    update();
  }
}
