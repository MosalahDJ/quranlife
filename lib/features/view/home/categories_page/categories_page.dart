import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/view/home/categories_page/widgets/categories.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'category'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),

          // Background image with blur
          ClipRect(
            child: Image.asset(
              "lib/core/assets/images/background_image/arch.jpg",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation<double>(0.2),
            ),
          ),

          // Content
          SafeArea(
            child: GetBuilder<ThemeController>(
              builder: (controller) => CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizeconfig.screenwidth! * 0.04,
                      vertical: Sizeconfig.screenheight! * 0.02,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Hero(
                        tag: 'categories',
                        child: ServiceCategorie(
                          categorycolor: Get.isDarkMode
                              ? kmaincolor2dark.withOpacity(0.85)
                              : Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
