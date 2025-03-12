import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadSavedAyahs();
  }

  List<Map<String, dynamic>> savedAyahs = [];
  bool isayahsaved = false;
  static const String savedAyahsKey = 'saved_ayahs';

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

  bool ifAyahAlredySaved(int ayahNumber) {
    return savedAyahs.any((ayah) => ayah['ayahNumber'] == ayahNumber);
  }
}
