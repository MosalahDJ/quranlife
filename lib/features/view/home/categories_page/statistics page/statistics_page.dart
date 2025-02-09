import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/statistics%20controller/statistics_controller.dart';
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
        title: const Text("Activity Statistics"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildSummaryCards(),
                    const SizedBox(height: 24),
                    _buildMainSummaryCard(),
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
    final StatisticsController statctrl = Get.find();

    return Row(
      children: [
        Obx(() => _countercard(
            icon: Icons.menu_book_rounded,
            title: 'Quran',
            count: '${statctrl.totalVersesRead.value} verses')),
        const SizedBox(width: 16),
        Obx(
          () => _countercard(
              icon: Icons.self_improvement_rounded,
              title: 'Duaa',
              count: '${statctrl.totalDuaaRead.value} adhkar'),
        ),
      ],
    );
  }

  Widget _countercard(
      {required IconData icon, required String title, required String count}) {
    return Expanded(
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
                  icon, // Duaa icon
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                count,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainSummaryCard() {
    final StatisticsController statctrl = Get.find();

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPieChartSection(),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.star_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overall Progress',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your spiritual journey statistics',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black54,
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
                  statctrl.totalVersesRead.value + statctrl.totalDuaaRead.value;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Items Read',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.black87,
                                ),
                      ),
                      Text(
                        '$totalItems',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: totalItems / 1000, // Assuming 1000 is the goal
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(totalItems / 10).toStringAsFixed(1)}% of daily goal',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
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
    final pieColors = [
      const Color(0xFF4CAF50), // أخضر للصباح
      const Color(0xFFFFA726), // برتقالي للمساء
      const Color(0xFF42A5F5), // أزرق للنوم
      const Color(0xFF9C27B0), // بنفسجي للاستيقاظ
      const Color(0xFF66BB6A), // أخضر فاتح للوضوء
      const Color(0xFFFF7043), // برتقالي محمر للصلاة
      const Color(0xFF26C6DA), // تركواز للأذان
      const Color(0xFF7E57C2), // بنفسجي فاتح للمسجد
      const Color(0xFFFFCA28), // أصفر ذهبي للمنزل
      const Color(0xFF8D6E63), // بني للخلاء
      const Color(0xFFEC407A), // وردي للطعام
      const Color(0xFF5C6BC0), // نيلي للسفر
      const Color(0xFF26A69A), // أخضر مزرق لبعد الصلاة
      const Color(0xFF78909C), // رمادي مزرق للمتفرقة
    ];

    return GetBuilder<StatisticsController>(
      builder: (controller) {
        final data = controller.duaaTypeStats;
        final total = data.values.fold(0, (sum, count) => sum + count);

        return Container(
          constraints: const BoxConstraints(
            minHeight: 300,
            maxHeight: 400,
          ),
          child: Column(
            children: [
              Text(
                'Duaa Distribution',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: total == 0
                    ? Center(
                        child: Text(
                          'No data available',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black54,
                                  ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Pie Chart
                          Expanded(
                            flex: 3,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 2,
                                  centerSpaceRadius: 40,
                                  sections: List.generate(
                                    data.length,
                                    (index) {
                                      final entry =
                                          data.entries.elementAt(index);
                                      return PieChartSectionData(
                                        color: pieColors[index],
                                        value: entry.value.toDouble(),
                                        title:
                                            '${(entry.value / total * 100).round()}%',
                                        radius: 80,
                                        titleStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          // Legend
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                data.length,
                                (index) {
                                  final entry = data.entries.elementAt(index);
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            color: pieColors[index],
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: pieColors[index]
                                                    .withOpacity(0.3),
                                                blurRadius: 4,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                entry.key,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              Text(
                                                entry.value.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
