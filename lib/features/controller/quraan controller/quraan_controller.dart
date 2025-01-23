import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quranlife/features/model/qurandata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuraanController extends GetxController {
  List<Surah> surahs = [];
  List<String> savedayahsId = [];

  @override
  void onInit() {
    super.onInit();
    loadQuranData();
    getSavedAyahs();
  }

  Future<List<Surah>> fetchQuranData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/quran.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Surah.fromMap(json)).toList();
  }

  Future<void> loadQuranData() async {
    surahs = await fetchQuranData();
    update();
  }

  addAyahToAyahsId(int ayahId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedayahsId.contains("$ayahId")
        ? savedayahsId.remove("$ayahId")
        : savedayahsId.add("$ayahId");
    prefs.setStringList("savedAyahsId", savedayahsId);
    update();
  }

  removeSavedAyah(int ayahindex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedayahsId.remove(savedayahsId[ayahindex]);
    prefs.setStringList("savedAyahsId", savedayahsId);
    update();
  }

  getSavedAyahs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedayahsId.addAll(prefs.getStringList("savedAyahsId") ?? []);
  }
}
