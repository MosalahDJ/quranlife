import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  Map<int, int> adkarCounts = {};
  int totalCount = 0;

  // Store dates when app was opened
  final Set<String> appOpenDates = {};

  @override
  void onInit() {
    super.onInit();
    initializeStats();
    markDayAsOpened(); // Mark today when app starts
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

  void markDayAsOpened() {
    final today = DateTime.now();
    final dateStr = '${today.year}-${today.month}-${today.day}';
    appOpenDates.add(dateStr);
    update();
  }

  bool wasAppOpenedOn(DateTime date) {
    final dateStr = '${date.year}-${date.month}-${date.day}';
    return appOpenDates.contains(dateStr);
  }

  bool isFutureDate(DateTime date) {
    final today = DateTime.now();
    return date.isAfter(DateTime(today.year, today.month, today.day));
  }

  // Daily statistics data
  List<DailyStats> get weeklyStats {
    final List<DailyStats> stats = [];
    final now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      final date = now.subtract(Duration(days: i));
      stats.add(DailyStats(
        date: date,
        dayNumber: 7 - i,
        isToday: i == 0,
        completionPercentage: (75 - i * 8).clamp(0, 100),
        colors: _getDayColors(date),
      ));
    }
    return stats;
  }

  List<Color> _getDayColors(DateTime date) {
    if (isFutureDate(date)) {
      return [
        Colors.grey.withOpacity(0.5),
        Colors.grey.withOpacity(0.3),
      ];
    }

    if (wasAppOpenedOn(date)) {
      return [
        Colors.green.shade600,
        Colors.green.shade400,
      ];
    }

    return [
      Colors.red.shade600,
      Colors.red.shade400,
    ];
  }

  String getDayName(DateTime date) {
    if (date.day == DateTime.now().day) return 'Today';

    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }
}

class DailyStats {
  final DateTime date;
  final int dayNumber;
  final bool isToday;
  final int completionPercentage;
  final List<Color> colors;

  DailyStats({
    required this.date,
    required this.dayNumber,
    required this.isToday,
    required this.completionPercentage,
    required this.colors,
  });
}
