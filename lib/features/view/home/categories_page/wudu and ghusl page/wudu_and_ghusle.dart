import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/ghusl_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/wudu_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';

class WuduAndGhusle extends StatefulWidget {
  const WuduAndGhusle({super.key});

  @override
  State<WuduAndGhusle> createState() => _WuduAndGhusleState();
}

class _WuduAndGhusleState extends State<WuduAndGhusle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: ShimmerText(
            text: 'wudu_ghusl'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(children: [
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/core/assets/images/background_image/arch.jpg'),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'wudu'.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  wudu(),
                  const SizedBox(height: 12),
                  Text(
                    'ghusl'.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ghusl(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          )
        ]));
  }
}

Widget wudu() {
  final LanguageController langctrl = Get.find();
  return GetBuilder<WuduController>(
    builder: (controller) => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Sizeconfig.screenwidth! * 0.05,
        vertical: 16,
      ),
      itemCount: controller.wuduTeaching.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: kmaincolor.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Duaa Content Container
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                    child: Column(
                      children: [
                        // Islamic Decoration
                        SizedBox(
                          height: Sizeconfig.screenheight! / 11,
                          width: Sizeconfig.screenwidth,
                          child: Image.asset(
                            'lib/core/assets/images/background_image/islamic_separator.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Duaa Text
                        Text(
                          langctrl.language.value == "ar"
                              ? controller.wuduTeaching[i].titlear!
                              : langctrl.language.value == "fr"
                                  ? controller.wuduTeaching[i].titlefr!
                                  : controller.wuduTeaching[i].titleen!,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontFamily: "Amiri",
                                    height: 1.8,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color
                                        ?.withOpacity(0.87),
                                  ),
                        ),
                        // Description if exists
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Colors.grey[400]
                                : kmaincolor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            langctrl.language.value == "ar"
                                ? controller.wuduTeaching[i].descriptionar!
                                : langctrl.language.value == "fr"
                                    ? controller.wuduTeaching[i].descriptionfr!
                                    : controller.wuduTeaching[i].descriptionen!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    height: 1.6,
                                    color: kmaincolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Cairo"),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        // source
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Colors.grey[400]
                                : kmaincolor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${"source".tr}:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        height: 1.6,
                                        color: kmaincolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: "Cairo"),
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                langctrl.language.value == "ar"
                                    ? controller.wuduTeaching[i].sourcear!
                                    : langctrl.language.value == "fr"
                                        ? controller.wuduTeaching[i].sourcefr!
                                        : controller.wuduTeaching[i].sourceen!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        height: 1.6,
                                        color: kmaincolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: "Cairo"),
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget ghusl() {
  final LanguageController langctrl = Get.find();
  return GetBuilder<GhuslController>(
    builder: (controller) => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Sizeconfig.screenwidth! * 0.05,
        vertical: 16,
      ),
      itemCount: controller.ghuslTeaching.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: kmaincolor.withOpacity(0.08),
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
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                  child: Column(
                    children: [
                      // Islamic Decoration
                      SizedBox(
                        height: Sizeconfig.screenheight! / 11,
                        width: Sizeconfig.screenwidth,
                        child: Image.asset(
                          'lib/core/assets/images/background_image/islamic_separator.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Duaa Text
                      Text(
                        langctrl.language.value == "ar"
                            ? controller.ghuslTeaching[i].titlear!
                            : langctrl.language.value == "fr"
                                ? controller.ghuslTeaching[i].titlefr!
                                : controller.ghuslTeaching[i].titleen!,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: "Amiri",
                              height: 1.8,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.color
                                  ?.withOpacity(0.87),
                            ),
                      ),
                      // Description if exists
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.grey[400]
                              : kmaincolor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          langctrl.language.value == "ar"
                              ? controller.ghuslTeaching[i].descriptionar!
                              : langctrl.language.value == "fr"
                                  ? controller.ghuslTeaching[i].descriptionfr!
                                  : controller.ghuslTeaching[i].descriptionen!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  height: 1.6,
                                  color: kmaincolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "Cairo"),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      // source
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.grey[400]
                              : kmaincolor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${"source".tr}:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      height: 1.6,
                                      color: kmaincolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: "Cairo"),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              langctrl.language.value == "ar"
                                  ? controller.ghuslTeaching[i].sourcear!
                                  : langctrl.language.value == "fr"
                                      ? controller.ghuslTeaching[i].sourcefr!
                                      : controller.ghuslTeaching[i].sourceen!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      height: 1.6,
                                      color: kmaincolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Cairo"),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
