import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  final RxInt totalVersesRead = 0.obs;
  final RxInt totalDuaasReadCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadVersesCount();
    loadTotalDuaasRead();
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
    update();
  }

  Future<void> incrementTotalDuaasRead() async {
    totalDuaasReadCount.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('total_duaas_read_key', totalDuaasReadCount.value);
    update();
  }
}
