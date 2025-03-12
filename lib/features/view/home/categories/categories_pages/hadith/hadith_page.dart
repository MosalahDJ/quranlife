import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/ahadith%20controller/ahadith_controller.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';

class HadithPage extends StatefulWidget {
  const HadithPage({super.key, required this.id});
  final int id;

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  @override
  Widget build(BuildContext context) {
    final LanguageController langctrl = Get.find();
    final AhadithController ahadithctrl = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: "${"hadith".tr} ${widget.id}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
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
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 0,
                left: 15,
                right: 15,
                top: 0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: LayoutBuilder(
                        builder:
                            (context, constraints) => Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: kmaincolor.withValues(alpha: 0.08),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
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
                                            langctrl.language.value == "ar"
                                                ? ahadithctrl
                                                    .ahadith[widget.id - 1]
                                                    .titleAr!
                                                : langctrl.language.value ==
                                                    "fr"
                                                ? ahadithctrl
                                                    .ahadith[widget.id - 1]
                                                    .titleFr!
                                                : ahadithctrl
                                                    .ahadith[widget.id - 1]
                                                    .titleEn!,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.copyWith(
                                              fontFamily: "Amiri",
                                              height: 1.8,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.color
                                                  ?.withValues(alpha: 0.87),
                                            ),
                                          ),
                                          Text(
                                            langctrl.language.value == "ar"
                                                ? ahadithctrl
                                                    .ahadith[widget.id - 1]
                                                    .narratorAr!
                                                : langctrl.language.value ==
                                                    "fr"
                                                ? ahadithctrl
                                                    .ahadith[widget.id - 1]
                                                    .narratorFr!
                                                : ahadithctrl
                                                    .ahadith[widget.id - 1]
                                                    .narratorEn!,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.copyWith(
                                              fontFamily: "Cairo",
                                              height: 1.8,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.color
                                                  ?.withValues(alpha: 0.87),
                                            ),
                                          ),
                                          // Description if exists
                                          const SizedBox(height: 16),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color:
                                                  Get.isDarkMode
                                                      ? Colors.grey[400]
                                                      : kmaincolor.withValues(
                                                        alpha: 0.05,
                                                      ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              langctrl.language.value == "ar"
                                                  ? ahadithctrl
                                                      .ahadith[widget.id - 1]
                                                      .textAr!
                                                  : langctrl.language.value ==
                                                      "fr"
                                                  ? ahadithctrl
                                                      .ahadith[widget.id - 1]
                                                      .textFr!
                                                  : ahadithctrl
                                                      .ahadith[widget.id - 1]
                                                      .textEn!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall?.copyWith(
                                                height: 1.6,
                                                color: kmaincolor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                fontFamily: "Cairo",
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                          // source
                                          const SizedBox(height: 16),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color:
                                                  Get.isDarkMode
                                                      ? Colors.grey[400]
                                                      : kmaincolor.withValues(
                                                        alpha: 0.05,
                                                      ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "source".tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        height: 1.6,
                                                        color: kmaincolor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        fontFamily: "Cairo",
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                                Text(
                                                  langctrl.language.value ==
                                                          "ar"
                                                      ? ahadithctrl
                                                          .ahadith[widget.id -
                                                              1]
                                                          .sourceAr!
                                                      : langctrl
                                                              .language
                                                              .value ==
                                                          "fr"
                                                      ? ahadithctrl
                                                          .ahadith[widget.id -
                                                              1]
                                                          .sourceFr!
                                                      : ahadithctrl
                                                          .ahadith[widget.id -
                                                              1]
                                                          .sourceEn!,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: LayoutBuilder(
                        builder:
                            (context, constraints) => Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: kmaincolor.withValues(alpha: 0.08),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
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
                                            "description".tr,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.copyWith(
                                              fontFamily: "Amiri",
                                              height: 1.8,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.color
                                                  ?.withValues(alpha: 0.87),
                                            ),
                                          ),
                                          // Description if exists
                                          const SizedBox(height: 16),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color:
                                                  Get.isDarkMode
                                                      ? Colors.grey[400]
                                                      : kmaincolor.withValues(
                                                        alpha: 0.05,
                                                      ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              langctrl.language.value == "ar"
                                                  ? ahadithctrl
                                                      .ahadith[widget.id - 1]
                                                      .explanationAr!
                                                  : langctrl.language.value ==
                                                      "fr"
                                                  ? ahadithctrl
                                                      .ahadith[widget.id - 1]
                                                      .explanationFr!
                                                  : ahadithctrl
                                                      .ahadith[widget.id - 1]
                                                      .explanationEn!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall?.copyWith(
                                                height: 1.6,
                                                color: kmaincolor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                fontFamily: "Cairo",
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
