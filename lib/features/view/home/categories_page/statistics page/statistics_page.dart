import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quranlife/core/Utils/constants.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Statistics".tr,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overall Statistics Card
              _buildStatCard(
                context,
                title: "Overall Progress",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                      context,
                      "Total Adhkar",
                      "1234",
                      Icons.assignment_turned_in_rounded,
                    ),
                    _buildStatItem(
                      context,
                      "Daily Streak",
                      "7 days",
                      Icons.local_fire_department_rounded,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Category Progress
              _buildStatCard(
                context,
                title: "Category Progress",
                child: SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 100,
                      barGroups: [
                        _buildBarGroup(0, 65, "Morning"),
                        _buildBarGroup(1, 80, "Evening"),
                        _buildBarGroup(2, 45, "Sleep"),
                        _buildBarGroup(3, 90, "Prayer"),
                      ],
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const titles = [
                                'Morning',
                                'Evening',
                                'Sleep',
                                'Prayer'
                              ];
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  titles[value.toInt()],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Weekly Activity
              _buildStatCard(
                context,
                title: "Weekly Activity",
                child: SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun'
                              ];
                              return Text(
                                days[value.toInt() % 7],
                                style: const TextStyle(fontSize: 12),
                              );
                            },
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 30),
                            const FlSpot(1, 45),
                            const FlSpot(2, 60),
                            const FlSpot(3, 40),
                            const FlSpot(4, 80),
                            const FlSpot(5, 70),
                            const FlSpot(6, 90),
                          ],
                          color: kmaincolor,
                          barWidth: 3,
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Achievement Stats
              _buildStatCard(
                context,
                title: "Achievements",
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: [
                    _buildAchievement(context, "7 Days Streak", "🔥", 70),
                    _buildAchievement(context, "Morning Person", "🌅", 90),
                    _buildAchievement(context, "Night Owl", "🌙", 85),
                    _buildAchievement(context, "Prayer Master", "🕌", 95),
                    _buildAchievement(context, "Dedicated", "⭐", 60),
                    _buildAchievement(context, "Consistent", "📈", 75),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context,
      {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: kmaincolor.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildStatItem(
      BuildContext context, String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: kmaincolor, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  BarChartGroupData _buildBarGroup(int x, double value, String title) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: kmaincolor,
          width: 20,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
        ),
      ],
    );
  }

  Widget _buildAchievement(
      BuildContext context, String title, String emoji, double progress) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 4,
            width: 40,
            child: LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(kmaincolor),
            ),
          ),
        ],
      ),
    );
  }
}
