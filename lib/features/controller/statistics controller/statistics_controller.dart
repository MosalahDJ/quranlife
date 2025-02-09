import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Controller responsible for managing user activity statistics and weekly data visualization
///
/// This controller tracks app opens per day and generates weekly statistics
/// for displaying user engagement patterns.
class StatisticsController extends GetxController {
  /// Stores the dates when the app was opened in the format 'YYYY-MM-DD'
  final Set<String> appOpenDates = {};

  static const String versesCountKey = 'verses_count_key';
  static const String duaaCountKey = 'duaa_count_key';

  final RxInt totalVersesRead = 0.obs;
  final RxInt totalDuaaRead = 0.obs;

  final RxMap<String, int> duaaTypeStats = <String, int>{
    'أذكار الصباح': 0,
    'أذكار المساء': 0,
    'أذكار النوم': 0,
    'أذكار الاستيقاظ': 0,
    'أذكار الوضوء': 0,
    'أذكار الصلاة': 0,
    'أذكار الأذان': 0,
    'أذكار المسجد': 0,
    'أذكار المنزل': 0,
    'أذكار الخلاء': 0,
    'أذكار الطعام': 0,
    'أذكار السفر': 0,
    'أذكار بعد الصلاة': 0,
    'أدعية متفرقة': 0,
  }.obs;

  static const String duaaTypeStatsKey = 'duaa_type_stats_key';

  @override
  void onInit() {
    super.onInit();
    loadVersesCount();
    loadDuaaCount();
    loadDuaaTypeStats();
  }

  Future<void> loadVersesCount() async {
    final prefs = await SharedPreferences.getInstance();
    totalVersesRead.value = prefs.getInt(versesCountKey) ?? 0;
  }

  Future<void> loadDuaaCount() async {
    final prefs = await SharedPreferences.getInstance();
    totalDuaaRead.value = prefs.getInt(duaaCountKey) ?? 0;
  }

  Future<void> loadDuaaTypeStats() async {
    final prefs = await SharedPreferences.getInstance();
    final String? statsJson = prefs.getString(duaaTypeStatsKey);
    if (statsJson != null) {
      final Map<String, dynamic> stats = json.decode(statsJson);
      duaaTypeStats.value = Map<String, int>.from(stats);
    }
  }

  Future<void> incrementVersesCount() async {
    totalVersesRead.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(versesCountKey, totalVersesRead.value);
    update();
  }

  Future<void> incrementDuaaCount() async {
    totalDuaaRead.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(duaaCountKey, totalDuaaRead.value);
    update();
  }

  Future<void> incrementDuaaType(String type) async {
    if (duaaTypeStats.containsKey(type)) {
      duaaTypeStats[type] = (duaaTypeStats[type] ?? 0) + 1;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(duaaTypeStatsKey, json.encode(duaaTypeStats));
      await incrementDuaaCount();
      update();
    }
  }
}
