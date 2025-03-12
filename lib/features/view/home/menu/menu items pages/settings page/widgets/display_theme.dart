import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';

class DisplayThemePage extends StatelessWidget {
  const DisplayThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        elevation: 0,
        centerTitle: true,
        title: ShimmerText(
          text: 'appearance'.tr,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ThemeController>(
        builder:
            (c) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(context, 'theme_mode'.tr),
                  _buildThemeOption(
                    context,
                    AppTheme.system,
                    'system_theme'.tr,
                    'system_theme_desc'.tr,
                  ),
                  _buildThemeOption(
                    context,
                    AppTheme.light,
                    'light_theme'.tr,
                    'light_theme_desc'.tr,
                  ),
                  _buildThemeOption(
                    context,
                    AppTheme.dark,
                    'dark_theme'.tr,
                    'dark_theme_desc'.tr,
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final ThemeController themeCtrl = Get.find();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: GetBuilder<ThemeController>(
        builder:
            (c) => Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:
                    themeCtrl.isDarkMode
                        ? kmaincolor4.withValues(alpha: 0.8)
                        : kmaincolor.withValues(alpha: 0.8),
                letterSpacing: 0.5,
              ),
            ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    AppTheme theme,
    String title,
    String description,
  ) {
    final ThemeController themeCtrl = Get.find();
    final LanguageController langCtrl = Get.find();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _applyThemeChange(themeCtrl, langCtrl, theme);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: GetBuilder<ThemeController>(
            builder:
                (c) => Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            themeCtrl.isDarkMode
                                ? kmaincolor4.withValues(alpha: 0.1)
                                : kmaincolor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        _getThemeIcon(theme),
                        color: themeCtrl.isDarkMode ? kmaincolor4 : kmaincolor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeCtrl.isDarkMode
                                      ? const Color.fromARGB(255, 207, 165, 118)
                                      : const Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  themeCtrl.isDarkMode
                                      ? Colors.grey[300]
                                      : Colors.grey[600],
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Radio<AppTheme>(
                        value: theme,
                        groupValue: themeCtrl.selectedTheme.value,
                        onChanged: (value) {
                          _applyThemeChange(themeCtrl, langCtrl, value!);
                        },
                        activeColor:
                            themeCtrl.isDarkMode ? kmaincolor4 : kmaincolor,
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }

  void _applyThemeChange(
    ThemeController themeCtrl,
    LanguageController langCtrl,
    AppTheme newTheme,
  ) {
    // Change the theme
    themeCtrl.changeTheme(newTheme);

    // Update locale
    Get.updateLocale(Locale(langCtrl.language.value));

    // Show a brief message to confirm theme change
    Get.snackbar(
      'theme_updated'.tr,
      'theme_applied'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          themeCtrl.isDarkMode ? Colors.grey[800] : Colors.grey[200],
      colorText: themeCtrl.isDarkMode ? Colors.white : Colors.black,
      duration: const Duration(seconds: 3),
    );
  }

  IconData _getThemeIcon(AppTheme theme) {
    switch (theme) {
      case AppTheme.system:
        return Icons.settings_suggest_outlined;
      case AppTheme.light:
        return Icons.light_mode_outlined;
      case AppTheme.dark:
        return Icons.dark_mode_outlined;
    }
  }
}
