import 'dart:async';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project/features/model/qurandata.dart';
import 'package:project/features/view/home/quraan%20page/surah_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Controller class for managing Quran data and navigation using GetX state management
class QuraanController extends GetxController {
  // List to store all Surahs data
  List<Surah> surahs = [];

  // Initialize controller and load Quran data
  @override
  void onInit() async {
    super.onInit();
    await loadQuranData();
    loadAndUpdateDailyAyah();
  }

  // Fetch Quran data from JSON file
  Future<List<Surah>> fetchQuranData() async {
    String jsonString =
        await rootBundle.loadString('lib/core/assets/json/quran.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Surah.fromMap(json)).toList();
  }

  // Load Quran data and update UI
  Future<void> loadQuranData() async {
    surahs = await fetchQuranData();
    update();
  }

  // Observable for tracking surah loading state
  final RxBool isLoadingNextSurah = false.obs;

  // Helper method to find a specific Surah by its number
  Surah? getSurahByNumber(int number) {
    try {
      return surahs.firstWhere((surah) => surah.number == number);
    } catch (e) {
      return null;
    }
  }

  // Get the next Surah based on current Surah number
  Surah? getNextSurah(int currentSurahNumber) {
    if (currentSurahNumber >= 114) return null;
    try {
      return surahs
          .firstWhere((surah) => surah.number == currentSurahNumber + 1);
    } catch (e) {
      return null;
    }
  }

  // Handle scroll events and trigger navigation when threshold is reached
  void handleScroll(
      double pixels, double maxScrollExtent, int currentSurahNumber) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (pixels > maxScrollExtent) {
        await navigateToNextSurah(currentSurahNumber: currentSurahNumber);
      }
    });
  }

  // Navigate to next Surah with transition animation
  Future<void> navigateToNextSurah({required int currentSurahNumber}) async {
    if (!isLoadingNextSurah.value) {
      try {
        isLoadingNextSurah.value = true;
        final nextSurah = getNextSurah(currentSurahNumber);
        if (nextSurah != null) {
          Get.off(
            () => SurahPage(surah: nextSurah),
            preventDuplicates: false,
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 500),
          );
        }
      } finally {
        isLoadingNextSurah.value = false;
      }
    }
  }

  final searchQuery = ''.obs;
  final searchResults = <Map<String, dynamic>>[].obs;
  final isSearching = false.obs;
  Timer? _debounceTimer;
// Add utility function to remove Arabic diacritics
  String removeDiacritics(String text) {
    return text.replaceAll(RegExp(r'[\u064B-\u065F\u0670\u0671]'), '');
  }

  void searchQuran(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      searchQuery.value = query;
      isSearching.value = true;

      // Normalize search query
      final normalizedQuery = removeDiacritics(query.toLowerCase());

      searchResults.clear();
      for (var surah in surahs) {
        for (var ayah in surah.ayahs) {
          // Normalize ayah text for comparison
          final normalizedAyahText = removeDiacritics(ayah.text.toLowerCase());
          if (normalizedAyahText.contains(normalizedQuery)) {
            searchResults.add({
              'surahName': surah.name,
              'surahNumber': surah.number,
              'ayahNumber': ayah.numberInSurah,
              'ayahText': ayah.text, // Keep original text with diacritics
            });
          }
        }
      }
      isSearching.value = false;
    });
  }

//daily Ayah
  final Random _random = Random();
  final Rx<Map<String, dynamic>> dailyAyah = Rx<Map<String, dynamic>>({});
  static const String lastupdatedkey = 'last_daily_ayah_update';
  static const String dailyayahkey = 'daily_ayah';

  int getRandomInRange(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }

  Map<String, dynamic> getRandomAyah() {
    // Get random surah
    final randomSurahIndex = getRandomInRange(0, surahs.length - 1);
    final randomSurah = surahs[randomSurahIndex];

    // Get random ayah from that surah
    final randomAyahIndex = getRandomInRange(0, randomSurah.ayahs.length - 1);
    final randomAyah = randomSurah.ayahs[randomAyahIndex];

    return {
      'surahName': randomSurah.name,
      'surahNumber': randomSurah.number,
      'ayahNumber': randomAyah.numberInSurah,
      'ayahText': randomAyah.text,
    };
  }

  Future<void> loadAndUpdateDailyAyah() async {
    final prefs = await SharedPreferences.getInstance();
    final lastUpdate = prefs.getInt(lastupdatedkey) ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    // Check if 24 hours have passed
    if (now - lastUpdate >= 24 * 60 * 60 * 1000) {
      // Generate new daily ayah
      dailyAyah.value = getRandomAyah();

      // Save new ayah and update time
      await prefs.setInt(lastupdatedkey, now);
      await prefs.setString(dailyayahkey, json.encode(dailyAyah.value));
    } else {
      // Load existing daily ayah
      final savedAyah = prefs.getString(dailyayahkey);
      if (savedAyah != null) {
        dailyAyah.value = json.decode(savedAyah);
      } else {
        dailyAyah.value = getRandomAyah();
        await prefs.setString(dailyayahkey, json.encode(dailyAyah.value));
      }
    }
  }
}
