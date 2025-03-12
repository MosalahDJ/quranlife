import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/statistics%20controller/statistics_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  final StatisticsController favoritectrl = Get.put(StatisticsController());

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: ShimmerText(
          text: 'activity_statistics'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          SizedBox(
            height: Sizeconfig.screenheight,
            width: Sizeconfig.screenwidth,
            child: Image.asset(
              "lib/core/assets/images/background_image/arch.jpg",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation<double>(0.2),
              height: Sizeconfig.screenheight,
              width: Sizeconfig.screenwidth,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'daily_progress'.tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildDailygoalCard(),
                    const SizedBox(height: 24),
                    Text(
                      'overall_progress'.tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSummaryCards(),
                    const SizedBox(height: 24),
                    _buildPieChartSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return GetBuilder<StatisticsController>(
      builder:
          (statctrl) => Row(
            children: [
              Expanded(
                child: _countercard(
                  icon: FlutterIslamicIcons.solidQuran2,
                  title: 'qoran'.tr,
                  count: '${statctrl.totalVersesRead.value} ${"verses".tr}',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _countercard(
                  icon: FlutterIslamicIcons.solidPrayingPerson,
                  title: 'duaa'.tr,
                  count: '${statctrl.totalDuaasReadCount.value} ${"dikr".tr}',
                ),
              ),
            ],
          ),
    );
  }

  Widget _countercard({
    required IconData icon,
    required String title,
    required String count,
  }) {
    return Card(
      elevation: 4,
      color:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.7)
              : Colors.white.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          color:
              Get.isDarkMode
                  ? kmaincolor2dark.withValues(alpha: 0.7)
                  : Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                size: 28,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Get.isDarkMode ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailygoalCard() {
    final StatisticsController statctrl = Get.find();

    return Card(
      elevation: 4,
      color:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.7)
              : Colors.white.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color:
              Get.isDarkMode
                  ? kmaincolor2dark.withValues(alpha: 0.7)
                  : Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.star_rounded,
                    color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'daily_goal'.tr,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'spiritual_journey'.tr,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Obx(() {
              final totalItems =
                  statctrl.dailyVersesRead.value +
                  statctrl.dailyDuaasRead.value;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total_items_read'.tr,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        '$totalItems ${"of".tr} 250',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: totalItems / 250, // Assuming 250 is the goal
                    backgroundColor: Colors.grey.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Get.isDarkMode ? kmaincolor4 : kmaincolor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(totalItems * 100 / 250).toStringAsFixed(1)}% ${'from_daily_goal'.tr}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChartSection() {
    final pieColors = [kmaincolor3, kmaincolor];

    return Card(
      elevation: 4,
      color:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.7)
              : Colors.white.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color:
              Get.isDarkMode
                  ? kmaincolor2dark.withValues(alpha: 0.7)
                  : Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'reading_distribution'.tr,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            GetBuilder<StatisticsController>(
              builder: (controller) {
                final total =
                    controller.totalVersesRead.value +
                    controller.totalDuaasReadCount.value;

                return total == 0
                    ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text('no_data'.tr),
                      ),
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 24),
                        SizedBox(
                          height: Sizeconfig.screenheight! / 3.5,
                          child: PieChart(
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: 40,
                              sections: [
                                PieChartSectionData(
                                  color: pieColors[0],
                                  value:
                                      controller.totalVersesRead.value
                                          .toDouble(),
                                  title:
                                      '${(controller.totalVersesRead.value / total * 100).round()}%',
                                  radius: 80,
                                  titleStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                PieChartSectionData(
                                  color: pieColors[1],
                                  value:
                                      controller.totalDuaasReadCount.value
                                          .toDouble(),
                                  title:
                                      '${(controller.totalDuaasReadCount.value / total * 100).round()}%',
                                  radius: 80,
                                  titleStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 34),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildLegendItem(
                              color: pieColors[0],
                              title: 'qoran'.tr,
                              value:
                                  "${controller.totalVersesRead.value} ${"verses".tr}",
                            ),
                            const SizedBox(height: 16),
                            _buildLegendItem(
                              color: pieColors[1],
                              title: 'duaa'.tr,
                              value:
                                  "${controller.totalDuaasReadCount.value} ${"dikr".tr}",
                            ),
                          ],
                        ),
                      ],
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String title,
    required String value,
  }) {
    return Container(
      width: Sizeconfig.screenwidth! / 2.7,
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
