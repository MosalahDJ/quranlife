import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quranlife/features/model/qurandata.dart';
import 'package:quranlife/features/view/home/quraan%20page/surah%20page/surah_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuraanController extends GetxController {
  List<Surah> surahs = [];
  List<Map<String, dynamic>> savedAyahs = [];
  bool isayahsaved = false;
  static const String savedAyahsKey = 'saved_ayahs';
  late AudioPlayer player;
  final Rx<PlayerState> playerState = PlayerState.stopped.obs;
  final RxInt currentPlayingAyah = RxInt(-1);

  // Add loading state tracking
  final RxBool isLoadingNextSurah = false.obs;

  // Juz start mapping - Maps Juz number to [SurahNumber, AyahNumber]
  final Map<int, List<int>> juzData = {
    1: [1, 1], // Al-Fatiha
    2: [2, 142], // Al-Baqarah
    3: [2, 253], // Al-Baqarah
    4: [3, 93], // Aal-Imran
    5: [4, 24], // An-Nisa
    6: [4, 148], // An-Nisa
    7: [5, 82], // Al-Ma'idah
    8: [6, 111], // Al-An'am
    9: [7, 88], // Al-A'raf
    10: [8, 41], // Al-Anfal
    11: [9, 93], // At-Tawbah
    12: [11, 6], // Hud
    13: [12, 53], // Yusuf
    14: [15, 1], // Al-Hijr
    15: [17, 1], // Al-Isra
    16: [18, 75], // Al-Kahf
    17: [21, 1], // Al-Anbya
    18: [23, 1], // Al-Mu'minun
    19: [25, 21], // Al-Furqan
    20: [27, 56], // An-Naml
    21: [29, 46], // Al-Ankabut
    22: [33, 31], // Al-Ahzab
    23: [36, 28], // Ya-Sin
    24: [39, 32], // Az-Zumar
    25: [41, 47], // Fussilat
    26: [46, 1], // Al-Ahqaf
    27: [51, 31], // Adh-Dhariyat
    28: [58, 1], // Al-Mujadila
    29: [67, 1], // Al-Mulk
    30: [78, 1], // An-Naba
  };

  // Add new state variables
  final RxDouble scrollProgress = 0.0.obs;
  final RxBool showIndicator = false.obs;
  final RxBool isNavigating = false.obs;
  static const double scrollThreshold = 100.0;

  @override
  void onInit() {
    super.onInit();
    loadQuranData();
    loadSavedAyahs();
    audioplayerinit();
    playerstatechanges();
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

  void audioplayerinit() {
    // Create the audio player.
    player = AudioPlayer();
    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);
  }

  playaudio(String ayahaudio, int ayahNumber) async {
    try {
      // If currently playing ayah is different, stop it first
      if (currentPlayingAyah.value != ayahNumber &&
          playerState.value == PlayerState.playing) {
        await player.stop();
      }
      currentPlayingAyah.value = ayahNumber;
      await player.play(UrlSource(ayahaudio));
    } catch (e) {
      // ignore: avoid_print
      print('error $e');
    }
  }

  playerstatechanges() {
    // Listen to player state changes
    player.onPlayerStateChanged.listen((state) {
      playerState.value = state == PlayerState.playing
          ? PlayerState.playing
          : PlayerState.stopped;
      if (state == PlayerState.stopped || state == PlayerState.completed) {
        currentPlayingAyah.value = -1;
      }
    });
  }

  // Get Surah object by number
  Surah? getSurahByNumber(int number) {
    try {
      return surahs.firstWhere((surah) => surah.number == number);
    } catch (e) {
      return null;
    }
  }

  Surah? getNextSurah(int currentSurahNumber) {
    if (currentSurahNumber >= 114) return null;
    try {
      return surahs
          .firstWhere((surah) => surah.number == currentSurahNumber + 1);
    } catch (e) {
      return null;
    }
  }

  Future<Surah?> getNextSurahWithLoading(int currentSurahNumber) async {
    if (currentSurahNumber >= 114) return null;
    try {
      isLoadingNextSurah.value = true;
      // Simulate loading time if needed
      await Future.delayed(const Duration(milliseconds: 500));
      final nextSurah =
          surahs.firstWhere((surah) => surah.number == currentSurahNumber + 1);
      isLoadingNextSurah.value = false;
      return nextSurah;
    } catch (e) {
      isLoadingNextSurah.value = false;
      return null;
    }
  }

  // Add scroll handling logic
  void handleScroll(
      double pixels, double maxScrollExtent, int currentSurahNumber) {
    if (pixels > maxScrollExtent) {
      final overscroll = pixels - maxScrollExtent;
      final progress = (overscroll / scrollThreshold).clamp(0.0, 1.0);

      if (!showIndicator.value && overscroll > 0) {
        showIndicator.value = true;
      }

      if (progress != scrollProgress.value) {
        scrollProgress.value = progress;
      }

      if (progress >= 1.0 && !isNavigating.value) {
        navigateToNextSurah(currentSurahNumber: currentSurahNumber);
      }
    } else if (showIndicator.value) {
      showIndicator.value = false;
      scrollProgress.value = 0.0;
    }
  }

  // Navigation logic
  Future<void> navigateToNextSurah({required int currentSurahNumber}) async {
    if (!isLoadingNextSurah.value && !isNavigating.value) {
      try {
        isNavigating.value = true;
        isLoadingNextSurah.value = true;
        showIndicator.value = true;

        final nextSurah = await getNextSurahWithLoading(currentSurahNumber);
        if (nextSurah != null) {
          Get.off(
            () => SurahPage(surah: nextSurah),
            preventDuplicates: false,
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 500),
          );
        }
      } finally {
        showIndicator.value = false;
        isNavigating.value = false;
        isLoadingNextSurah.value = false;
      }
    }
  }

  // Reset state when leaving page
  void resetSurahPageState() {
    scrollProgress.value = 0.0;
    showIndicator.value = false;
    isNavigating.value = false;
    isLoadingNextSurah.value = false;
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();
    super.dispose();
  }
}
