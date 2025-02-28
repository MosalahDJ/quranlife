import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/view/home/menu/menu%20items%20pages/settings%20page/widgets/display_theme.dart';
import 'package:quranlife/features/view/home/menu/menu%20items%20pages/settings%20page/widgets/edit_profile_page.dart';
import 'package:quranlife/features/view/home/menu/menu%20items%20pages/settings%20page/widgets/language_page.dart';
import 'package:quranlife/features/view/home/menu/menu%20items%20pages/settings%20page/widgets/notification.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        elevation: 0,
        centerTitle: true,
        title: ShimmerText(
          text: 'settings'.tr,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(context, 'general_settings'.tr),
            _buildSettingsCategory(
              icon: Icons.person_outline,
              title: 'account_settings'.tr,
              onTap: () {
                Get.to(() => EditProfilePage());
              },
              description: 'account_settings_desc'.tr,
            ),
            _buildSettingsCategory(
              icon: Icons.palette_outlined,
              title: 'appearance'.tr,
              onTap: () => Get.to(() => const DisplayThemePage()),
              description: 'appearance_desc'.tr,
            ),
            _buildSectionHeader(context, 'app_settings'.tr),
            _buildSettingsCategory(
              icon: Icons.notifications_outlined,
              title: 'notifications'.tr,
              onTap: () => Get.to(() => NotificationSettings()),
              description: 'notifications_desc'.tr,
            ),
            _buildSettingsCategory(
              icon: Icons.language_outlined,
              title: 'language'.tr,
              onTap: () => Get.to(() => const LanguagePage()),
              description: 'language_desc'.tr,
            ),
            _buildSectionHeader(context, 'support'.tr),
            _buildSettingsCategory(
              icon: Icons.help_outline,
              title: 'help_support'.tr,
              onTap: () => Get.toNamed('/help'),
              description: 'help_support_desc'.tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode
              ? kmaincolor4.withOpacity(0.8)
              : kmaincolor.withOpacity(0.8),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingsCategory({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? kmaincolor4.withOpacity(0.1)
                      : kmaincolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon,
                    color: Get.isDarkMode ? kmaincolor4 : kmaincolor, size: 24),
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
                        color: Get.isDarkMode
                            ? const Color.fromARGB(255, 207, 165, 118)
                            : const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Get.isDarkMode
                            ? Colors.grey[300]
                            : Colors.grey[600],
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 24,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
