import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadfavoriteAyahs();
  }

  List<Map<String, dynamic>> favoriteAyahs = [];
  bool isayahfavorite = false;
  static const String favoriteAyahsKey = 'favorite_ayahs';

  Future<void> loadfavoriteAyahs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoriteAyahsJson = prefs.getString(favoriteAyahsKey);
    if (favoriteAyahsJson != null) {
      final List<dynamic> decodedList = json.decode(favoriteAyahsJson);
      favoriteAyahs = decodedList.cast<Map<String, dynamic>>().toList();
      update();
    }
  }

  Future<void> _favoriteToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedList = json.encode(favoriteAyahs);
    await prefs.setString(favoriteAyahsKey, encodedList);
  }

  void favoriteAyah(int surahNumber, int ayahNumber, String ayahText,
      String surahName, int ayahnumberinsurah) {
    if (ifAyahAlredyfavorite(ayahNumber)) {
      int indexToRemove =
          favoriteAyahs.indexWhere((ayah) => ayah['ayahNumber'] == ayahNumber);
      if (indexToRemove != -1) {
        favoriteAyahs.removeAt(indexToRemove);
        isayahfavorite = false;
      }
    } else {
      favoriteAyahs.add({
        'surahNumber': surahNumber,
        'ayahNumber': ayahNumber,
        'ayahNumberinsurah': ayahnumberinsurah,
        'ayahText': ayahText,
        'surahName': surahName,
      });
      isayahfavorite = true;
    }
    _favoriteToDisk();
    update();
  }

  bool ifAyahAlredyfavorite(int ayahNumber) {
    return favoriteAyahs.any((ayah) => ayah['ayahNumber'] == ayahNumber);
  }
}
