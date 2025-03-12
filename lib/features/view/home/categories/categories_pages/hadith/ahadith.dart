import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/ahadith%20controller/ahadith_controller.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/view/home/categories/categories_pages/hadith/hadith_page.dart';

class Ahadith extends StatefulWidget {
  const Ahadith({super.key});

  @override
  State<Ahadith> createState() => _AhadithState();
}

class _AhadithState extends State<Ahadith> {
  @override
  Widget build(BuildContext context) {
    final LanguageController langctrl = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: "al-arba'in_nawawiyyah".tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            child: GetBuilder<AhadithController>(
              builder:
                  (controller) => ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizeconfig.screenwidth! * 0.05,
                      vertical: 10,
                    ),
                    itemCount: controller.ahadith.length,
                    itemBuilder:
                        (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: LayoutBuilder(
                            builder:
                                (context, constraints) => InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => HadithPage(
                                        id: controller.ahadith[i].id!,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).cardColor.withValues(alpha: 0.7),
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${"hadith".tr} ${controller.ahadith[i].id}",
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
                                                  ? controller
                                                      .ahadith[i]
                                                      .titleAr!
                                                  : langctrl.language.value ==
                                                      "fr"
                                                  ? controller
                                                      .ahadith[i]
                                                      .titleFr!
                                                  : controller
                                                      .ahadith[i]
                                                      .titleEn!,
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
