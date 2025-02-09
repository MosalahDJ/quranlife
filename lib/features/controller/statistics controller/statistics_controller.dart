import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StatisticsController extends GetxController {
  final RxInt totalVersesRead = 0.obs;
  final RxInt totalDuaaRead = 0.obs;
  final RxInt totalDuaasReadCount = 0.obs;
  final RxMap<String, int> duaaTypeStats = <String, int>{
    'أذكار الصباح': 0,
    'أذكار المساء': 0,
    'أذكار أخرى': 0,
    'أدعية متفرقة': 0,
  }.obs;

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
    totalVersesRead.value = prefs.getInt('verses_count_key') ?? 0;
  }

  Future<void> loadDuaaCount() async {
    final prefs = await SharedPreferences.getInstance();
    totalDuaaRead.value = prefs.getInt('duaa_count_key') ?? 0;
  }

  Future<void> loadDuaaTypeStats() async {
    final prefs = await SharedPreferences.getInstance();
    final String? statsJson = prefs.getString('duaa_type_stats_key');
    if (statsJson != null) {
      final Map<String, dynamic> stats = json.decode(statsJson);
      duaaTypeStats.value = Map<String, int>.from(stats);
    }
  }

  Future<void> loadTotalDuaasRead() async {
    final prefs = await SharedPreferences.getInstance();
    totalDuaasReadCount.value = prefs.getInt('total_duaas_read_key') ?? 0;
  }

  Future<void> incrementVersesCount() async {
    totalVersesRead.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("verses_count_key", totalVersesRead.value);
    update();
  }

  Future<void> incrementDuaaCount() async {
    totalDuaaRead.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('duaa_count_key', totalDuaaRead.value);
    update();
  }

  Future<void> incrementDuaaType(String type) async {
    if (duaaTypeStats.containsKey(type)) {
      duaaTypeStats[type] = (duaaTypeStats[type] ?? 0) + 1;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('duaa_type_stats_key', json.encode(duaaTypeStats));
      update();
    }
  }

  Future<void> incrementTotalDuaasRead() async {
    totalDuaasReadCount.value++;
    totalDuaaRead.value++; // تحديث كلا العدادين
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('total_duaas_read_key', totalDuaasReadCount.value);
    await prefs.setInt('duaa_count_key', totalDuaaRead.value);
    update();
  }
}
