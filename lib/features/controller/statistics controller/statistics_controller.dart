import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  final RxInt totalVersesRead = 0.obs;
  final RxInt totalDuaasReadCount = 0.obs;
  final RxInt dailyVersesRead = 0.obs;
  final RxInt dailyDuaasRead = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadVersesCount();
    loadTotalDuaasRead();
    loadDailyCounts();
    checkAndResetDaily();
  }

  Future<void> loadVersesCount() async {
    final prefs = await SharedPreferences.getInstance();
    totalVersesRead.value = prefs.getInt('verses_count_key') ?? 0;
  }

  Future<void> loadTotalDuaasRead() async {
    final prefs = await SharedPreferences.getInstance();
    totalDuaasReadCount.value = prefs.getInt('total_duaas_read_key') ?? 0;
  }

  Future<void> incrementVersesCount() async {
    totalVersesRead.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("verses_count_key", totalVersesRead.value);
    dailyVersesRead.value++;
    final dailyprefs = await SharedPreferences.getInstance();
    await dailyprefs.setInt('daily_verses_key', dailyVersesRead.value);
    update();
  }

  Future<void> incrementTotalDuaasRead() async {
    totalDuaasReadCount.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('total_duaas_read_key', totalDuaasReadCount.value);
    dailyDuaasRead.value++;
    final dailyprefs = await SharedPreferences.getInstance();
    await dailyprefs.setInt('daily_duaas_key', dailyDuaasRead.value);
    update();
  }

  Future<void> loadDailyCounts() async {
    final prefs = await SharedPreferences.getInstance();
    final lastResetDate = prefs.getString('last_reset_date') ?? '';

    if (isNewDay(lastResetDate)) {
      await resetDailyCounts();
    } else {
      dailyVersesRead.value = prefs.getInt('daily_verses_key') ?? 0;
      dailyDuaasRead.value = prefs.getInt('daily_duaas_key') ?? 0;
    }
  }

  bool isNewDay(String lastResetDate) {
    if (lastResetDate.isEmpty) return true;
    final lastReset = DateTime.parse(lastResetDate);
    final now = DateTime.now();
    return !lastReset.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
  }

  Future<void> resetDailyCounts() async {
    final prefs = await SharedPreferences.getInstance();
    dailyVersesRead.value = 0;
    dailyDuaasRead.value = 0;
    await prefs.setInt('daily_verses_key', 0);
    await prefs.setInt('daily_duaas_key', 0);
    await prefs.setString('last_reset_date', DateTime.now().toIso8601String());
  }

  Future<void> checkAndResetDaily() async {
    final prefs = await SharedPreferences.getInstance();
    final lastResetDate = prefs.getString('last_reset_date') ?? '';
    if (isNewDay(lastResetDate)) {
      await resetDailyCounts();
    }
  }
}
