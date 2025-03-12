import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/adkar%20controller/adkar_controller.dart';
import 'package:project/features/controller/statistics%20controller/statistics_controller.dart';

class DuaaPage extends StatefulWidget {
  const DuaaPage({
    super.key,
    required this.duaapageID,
    required this.duaapagename,
  });

  final int duaapageID;
  final String duaapagename;

  @override
  State<DuaaPage> createState() => _DuaaPageState();
}

class _DuaaPageState extends State<DuaaPage> {
  final AdkarController _adkarctrl = Get.find();

  @override
  void dispose() {
    _adkarctrl.resetDuaaCounts();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statsController = Get.put<StatisticsController>(
      StatisticsController(),
    );

    // Filter duaas when page is built
    _adkarctrl.filterAdkarBySection(widget.duaapageID);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.duaapagename.tr,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: GetBuilder<AdkarController>(
              builder:
                  (controller) => ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizeconfig.screenwidth! * 0.05,
                      vertical: 16,
                    ),
                    itemCount: controller.filteredAdkar.length,
                    itemBuilder:
                        (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: LayoutBuilder(
                            builder:
                                (context, constraints) => Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kmaincolor.withValues(
                                          alpha: 0.08,
                                        ),
                                        blurRadius: 15,
                                        offset: const Offset(0, 5),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Duaa Content Container
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                          24,
                                          28,
                                          24,
                                          20,
                                        ),
                                        child: Column(
                                          children: [
                                            // Islamic Decoration
                                            SizedBox(
                                              height:
                                                  Sizeconfig.screenheight! / 11,
                                              width: Sizeconfig.screenwidth,
                                              child: Image.asset(
                                                'lib/core/assets/images/background_image/islamic_separator.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            // Duaa Text
                                            Text(
                                              controller
                                                  .filteredAdkar[i]
                                                  .content!,
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.copyWith(
                                                fontFamily: "Amiri",
                                                height: 1.8,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.color
                                                    ?.withValues(alpha: 0.87),
                                              ),
                                            ),
                                            // Description if exists
                                            if (controller
                                                .filteredAdkar[i]
                                                .description!
                                                .isNotEmpty) ...[
                                              const SizedBox(height: 16),
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  12,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      Get.isDarkMode
                                                          ? Colors.grey[400]
                                                          : kmaincolor
                                                              .withValues(
                                                                alpha: 0.05,
                                                              ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  controller
                                                      .filteredAdkar[i]
                                                      .description!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        height: 1.6,
                                                        color: kmaincolor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        fontFamily: "Cairo",
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      // Counter Button
                                      Container(
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: kmaincolor,
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                bottom: Radius.circular(15),
                                              ),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              if (controller
                                                      .filteredAdkar[i]
                                                      .count! >
                                                  0) {
                                                setState(() {
                                                  controller
                                                      .filteredAdkar[i]
                                                      .count = controller
                                                          .filteredAdkar[i]
                                                          .count! -
                                                      1;
                                                });
                                                statsController
                                                    .incrementTotalDuaasRead();
                                                statsController.update();
                                                controller.update();
                                              }
                                            },
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                  bottom: Radius.circular(15),
                                                ),
                                            child: Opacity(
                                              opacity:
                                                  controller
                                                              .filteredAdkar[i]
                                                              .count! >
                                                          0
                                                      ? 1.0
                                                      : 0.5,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                    ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      controller
                                                                  .filteredAdkar[i]
                                                                  .count! >
                                                              0
                                                          ? Icons
                                                              .touch_app_rounded
                                                          : Icons
                                                              .check_circle_outline,
                                                      color: Colors.white,
                                                      size: 22,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Text(
                                                      "${controller.filteredAdkar[i].count} ${"count".tr}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ),
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
