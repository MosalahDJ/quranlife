import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';

class NotificationSettings extends StatelessWidget {
  NotificationSettings({super.key});

  final FCMController fcmctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        elevation: 0,
        centerTitle: true,
        title: ShimmerText(
          text: 'notifications'.tr,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<FCMController>(
        builder:
            (controller) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(context, 'notification_settings'.tr),
                  _buildNotificationOption(
                    context,
                    'chat_notifications'.tr,
                    'chat_notifications_desc'.tr,
                    Icons.chat,
                    fcmctrl.value.value,
                    (value) {
                      fcmctrl.onchangesubscribtion(value, "chat");
                    },
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
      child: Text(
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
    );
  }

  Widget _buildNotificationOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    bool switchvalue,
    ValueSetter onchanged,
  ) {
    final ThemeController themeCtrl = Get.find();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
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
                  icon,
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
                () => Switch(
                  value: switchvalue,
                  onChanged: onchanged,
                  activeColor: themeCtrl.isDarkMode ? kmaincolor4 : kmaincolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
