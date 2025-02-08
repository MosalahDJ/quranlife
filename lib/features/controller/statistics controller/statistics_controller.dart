import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Controller responsible for managing user activity statistics and weekly data visualization
///
/// This controller tracks app opens per day and generates weekly statistics
/// for displaying user engagement patterns.
class StatisticsController extends GetxController {
  /// Stores the dates when the app was opened in the format 'YYYY-MM-DD'
  final Set<String> appOpenDates = {};

  static const String versesCountKey = 'verses_count_key';
  final RxInt totalVersesRead = 0.obs;

  @override
  void onInit() {
    super.onInit();
    markDayAsOpened();
    loadVersesCount();
  }

  Future<void> loadVersesCount() async {
    final prefs = await SharedPreferences.getInstance();
    totalVersesRead.value = prefs.getInt(versesCountKey) ?? 0;
  }

  Future<void> incrementVersesCount() async {
    totalVersesRead.value++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(versesCountKey, totalVersesRead.value);
    update();
  }

  /// Records the current day as an app open day
  ///
  /// This method is called when the app starts and should be called
  /// whenever meaningful user activity occurs
  void markDayAsOpened() {
    final today = DateTime.now();
    final dateStr = '${today.year}-${today.month}-${today.day}';
    appOpenDates.add(dateStr);
    update();
  }

  /// Checks if the app was opened on a specific date
  ///
  /// Returns true if there was any activity on the given date
  bool wasAppOpenedOn(DateTime date) {
    final dateStr = '${date.year}-${date.month}-${date.day}';
    return appOpenDates.contains(dateStr);
  }

  /// Determines if a given date is in the future
  ///
  /// Used to distinguish between past, present, and future days
  /// in the weekly statistics view
  bool isFutureDate(DateTime date) {
    final today = DateTime.now();
    return date.isAfter(DateTime(today.year, today.month, today.day));
  }

  /// Generates statistics for the current week, starting from Sunday
  ///
  /// Returns a list of [DailyStats] objects containing:
  /// - Date information
  /// - Today/future day status
  /// - Color scheme based on app activity
  List<DailyStats> get weeklyStats {
    final List<DailyStats> stats = [];
    final now = DateTime.now();
    // Calculate the most recent Sunday to start the week
    final lastSunday = now.subtract(Duration(days: now.weekday));

    for (int i = 0; i < 7; i++) {
      final date = lastSunday.add(Duration(days: i));
      final isToday = date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
      final isFutureDay = date.isAfter(now);

      stats.add(DailyStats(
        date: date,
        dayNumber: i + 1,
        isToday: isToday,
        isFutureDay: isFutureDay,
        colors: _getDayColors(date, isToday, isFutureDay),
      ));
    }
    return stats;
  }

  /// Determines the color scheme for a specific day based on its status
  ///
  /// Returns a list of two colors for gradient:
  /// - Grey for future days
  /// - Theme color for days with activity
  /// - Red for days without activity
  List<Color> _getDayColors(DateTime date, bool isToday, bool isFutureDay) {
    final themeColor = Get.theme.primaryColor;

    if (isFutureDay) {
      return [
        Colors.grey.shade200,
        Colors.grey.shade100,
      ];
    }

    if (wasAppOpenedOn(date)) {
      return [
        themeColor.withOpacity(0.7),
        themeColor.withOpacity(0.5),
      ];
    }

    return [
      Colors.red.shade300,
      Colors.red.shade200,
    ];
  }

  /// Formats the day name for display
  ///
  /// Returns either 'Today' for the current day or
  /// a three-letter day abbreviation (e.g., 'Sun', 'Mon')
  String getDayName(DateTime date) {
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    if (date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day) {
      return 'Today';
    }
    return days[date.weekday % 7];
  }
}

/// Data class representing daily statistics
///
/// Contains all necessary information for displaying a single day
/// in the weekly statistics view
class DailyStats {
  /// The actual date this stat represents
  final DateTime date;

  /// Position in the week (1-7)
  final int dayNumber;

  /// Whether this represents today
  final bool isToday;

  /// Whether this date is in the future
  final bool isFutureDay;

  /// Colors for the day's visual representation
  final List<Color> colors;

  DailyStats({
    required this.date,
    required this.dayNumber,
    required this.isToday,
    required this.isFutureDay,
    required this.colors,
  });
}
