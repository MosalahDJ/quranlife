import 'package:get/get.dart';

class StatisticsController extends GetxController {
  Map<int, int> adkarCounts = {};
  int totalCount = 0;

  @override
  void onInit() {
    super.onInit();
    initializeStats();
  }

  void initializeStats() {
    // Initialize statistics for each Adkar type (IDs 1-14)
    for (int i = 1; i <= 14; i++) {
      adkarCounts[i] = 0;
    }
    updateTotalCount();
  }

  void incrementCount(int adkarTypeId) {
    adkarCounts[adkarTypeId] = (adkarCounts[adkarTypeId] ?? 0) + 1;
    updateTotalCount();
    update();
  }

  void updateTotalCount() {
    totalCount = adkarCounts.values.fold(0, (sum, count) => sum + count);
  }

  double getPercentage(int adkarTypeId) {
    if (totalCount == 0) return 0;
    return (adkarCounts[adkarTypeId] ?? 0) / totalCount * 100;
  }
}
