import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/view/home/categories/categories_pages/haj%20and%20omra/haj_page.dart';
import 'package:project/features/view/home/categories/categories_pages/haj%20and%20omra/omra_page.dart';

class Hajandomrapage extends StatefulWidget {
  const Hajandomrapage({super.key});

  @override
  State<Hajandomrapage> createState() => _HajandomrapageState();
}

class _HajandomrapageState extends State<Hajandomrapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: "hajj_umrah".tr,
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
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: Sizeconfig.screenwidth! * 0.05,
                vertical: 10,
              ),
              children: [
                cardwidget(
                  title: "haj".tr,
                  subtitle: "hajguid".tr,
                  ontap: () => Get.to(() => const HajPage()),
                ),
                cardwidget(
                  title: "omarah".tr,
                  subtitle: "omraguid".tr,
                  ontap: () => Get.to(() => const OmraPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget cardwidget({
  required String title,
  required String subtitle,
  required VoidCallback ontap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: LayoutBuilder(
      builder:
          (context, constraints) => InkWell(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withValues(alpha: 0.7),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontFamily: "Amiri",
                        height: 1.8,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.color?.withValues(alpha: 0.87),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            Get.isDarkMode
                                ? Colors.grey[400]
                                : kmaincolor.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
  );
}
