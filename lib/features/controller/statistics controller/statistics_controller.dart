import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StatisticsController extends GetxController {
  static const String versesCountKey = 'verses_count_key';
  static const String duaaCountKey = 'duaa_count_key';
  static const String totalDuaasReadKey = 'total_duaas_read_key';

  final RxInt totalVersesRead = 0.obs;
  final RxInt totalDuaaRead = 0.obs;
  final RxInt totalDuaasReadCount = 0.obs;

  final RxMap<String, int> duaaTypeStats = <String, int>{
    'أذكار الصباح': 0,
    'أذكار المساء': 0,
    'أذكار أخرى': 0,
    'أدعية متفرقة': 0,
  }.obs;

  static const String duaaTypeStatsKey = 'duaa_type_stats_key';

  @override
  void onInit() {
    super.onInit();
    loadVersesCount();
    loadDuaaCount();
    loadDuaaTypeStats();
    loadTotalDuaasRead();
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

  Future<void> loadTotalDuaasRead() async {
    final prefs = await SharedPreferences.getInstance();
    totalDuaasReadCount.value = prefs.getInt(totalDuaasReadKey) ?? 0;
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

  Future<void> incrementTotalDuaasRead() async {
    totalDuaasReadCount.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(totalDuaasReadKey, totalDuaasReadCount.value);
    update();
  }
}
