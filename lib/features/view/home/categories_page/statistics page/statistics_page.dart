import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/statistics%20controller/statistics_controller.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final StatisticsController statsController = Get.put(StatisticsController());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Statistics"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWeeklyTitle(),
                _buildDailyStatsScroll(),
                const SizedBox(height: 24),
                _buildSummaryCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_rounded,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            'Weekly Activity',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyStatsScroll() {
    // Calculate responsive dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.18; // 18% of screen width
    final cardHeight = cardWidth * 1.5; // Aspect ratio 1.2

    // Calculate indicator size based on card dimensions
    final indicatorSize = cardWidth * 0.1; // 10% of card width
    const minIndicatorSize = 6.0; // Minimum size in pixels

    return SizedBox(
      height: cardHeight,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: GetBuilder<StatisticsController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: controller.weeklyStats
                  .map((stats) => Container(
                        width: cardWidth,
                        margin: EdgeInsets.only(
                          right: 8,
                          left: stats.isToday ? 4 : 0,
                        ),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                  50 * (1 - _animationController.value), 0),
                              child: Opacity(
                                opacity: _animationController.value,
                                child: Card(
                                  elevation: stats.isFutureDay ? 0 : 2,
                                  shadowColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: stats.colors,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: cardHeight *
                                          0.12, // 12% of card height
                                      horizontal:
                                          cardWidth * 0.1, // 10% of card width
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '${stats.date.day}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  color: stats.isFutureDay
                                                      ? Colors.black45
                                                      : Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: cardHeight *
                                                0.02), // 2% of card height
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            controller.getDayName(stats.date),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: stats.isFutureDay
                                                      ? Colors.black45
                                                      : Colors.black87,
                                                  fontWeight: stats.isToday
                                                      ? FontWeight.w600
                                                      : FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        if (stats.isToday) ...[
                                          SizedBox(height: cardHeight * 0.04),
                                          Container(
                                            width: indicatorSize.clamp(
                                                minIndicatorSize, 8.0),
                                            height: indicatorSize.clamp(
                                                minIndicatorSize, 8.0),
                                            margin: EdgeInsets.only(
                                              top: cardHeight * 0.02,
                                              bottom: cardHeight * 0.02,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.3),
                                                  blurRadius: 4,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.menu_book_rounded, // Quran icon
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                  ),
                  Text(
                    'Quran',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '150 verses', // Replace with actual count
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.self_improvement_rounded, // Duaa icon
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                  ),
                  Text(
                    'Duaa',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '75 adhkar', // Replace with actual count
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
