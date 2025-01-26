import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quranlife/features/model/qurandata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuraanController extends GetxController {
  List<Surah> surahs = [];
  List<Map<String, dynamic>> savedAyahs = [];
  bool isayahsaved = false;
  static const String savedAyahsKey = 'saved_ayahs';

  // Slider control variables
  RxDouble currentSliderValue = 0.0.obs;
  RxInt currentAyahIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  Surah? currentSurah;

  @override
  void onInit() {
    super.onInit();
    loadQuranData();
    loadSavedAyahs();
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

  Future<void> loadSavedAyahs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedAyahsJson = prefs.getString(savedAyahsKey);
    if (savedAyahsJson != null) {
      final List<dynamic> decodedList = json.decode(savedAyahsJson);
      savedAyahs = decodedList.cast<Map<String, dynamic>>().toList();
      update();
    }
  }

  Future<void> _saveToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedList = json.encode(savedAyahs);
    await prefs.setString(savedAyahsKey, encodedList);
  }

  void saveAyah(int surahNumber, int ayahNumber, String ayahText,
      String surahName, int ayahnumberinsurah) {
    if (ifAyahAlredySaved(ayahNumber)) {
      int indexToRemove =
          savedAyahs.indexWhere((ayah) => ayah['ayahNumber'] == ayahNumber);
      if (indexToRemove != -1) {
        savedAyahs.removeAt(indexToRemove);
        isayahsaved = false;
      }
    } else {
      savedAyahs.add({
        'surahNumber': surahNumber,
        'ayahNumber': ayahNumber,
        'ayahNumberinsurah': ayahnumberinsurah,
        'ayahText': ayahText,
        'surahName': surahName,
      });
      isayahsaved = true;
    }
    _saveToDisk();
    update();
  }

  void removeSavedAyah(int index) {
    savedAyahs.removeAt(index);
    _saveToDisk();
    update();
  }

  bool ifAyahAlredySaved(int ayahNumber) {
    return savedAyahs.any((ayah) => ayah['ayahNumber'] == ayahNumber);
  }

  void updateSliderPosition(double position) {
    currentSliderValue.value = position;
    int ayahIndex = (position * currentSurah!.ayahs.length).round();
    currentAyahIndex.value = ayahIndex.clamp(0, currentSurah!.ayahs.length - 1);
    update();
  }

  void scrollToAyah(int index) {
    if (scrollController.hasClients) {
      final double itemHeight = 150.0; // Approximate height of each ayah
      scrollController.animateTo(
        index * itemHeight,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void initSurahControls(Surah surah) {
    currentSurah = surah;
    currentAyahIndex.value = 0;
    currentSliderValue.value = 0;
    update();
  }
}
