import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/notfication%20controller/work_manager_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';

class NotificationSettings extends StatelessWidget {
  NotificationSettings({super.key});
  final WorkManagerController wkmctrl = Get.find();

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
      body: GetBuilder<WorkManagerController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(context, 'notification_settings'.tr),
              _buildNotificationOption(
                context,
                NotificationType.adhan,
                'adhan_notifications'.tr,
                'adhan_notifications_desc'.tr,
                Icons.access_time_rounded,
              ),
              _buildNotificationOption(
                context,
                NotificationType.adhkar,
                'adhkar_notifications'.tr,
                'adhkar_notifications_desc'.tr,
                Icons.favorite_rounded,
              ),
              _buildNotificationOption(
                context,
                NotificationType.quraan,
                'quran_notifications'.tr,
                'quran_notifications_desc'.tr,
                Icons.book_rounded,
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
          color: themeCtrl.isDarkMode
              ? kmaincolor4.withOpacity(0.8)
              : kmaincolor.withOpacity(0.8),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildNotificationOption(
    BuildContext context,
    NotificationType type,
    String title,
    String description,
    IconData icon,
  ) {
    final ThemeController themeCtrl = Get.find();

    bool getValue() {
      switch (type) {
        case NotificationType.adhan:
          return wkmctrl.adhansubscribition.value;
        case NotificationType.adhkar:
          return wkmctrl.adhkarsubscribition.value;
        case NotificationType.quraan:
          return wkmctrl.quraansubscribition.value;
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          final bool newValue = !getValue();
          wkmctrl.onChangeSubscription(type, newValue);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeCtrl.isDarkMode
                      ? kmaincolor4.withOpacity(0.1)
                      : kmaincolor.withOpacity(0.1),
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
                        color: themeCtrl.isDarkMode
                            ? const Color.fromARGB(255, 207, 165, 118)
                            : const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: themeCtrl.isDarkMode
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
                  value: getValue(),
                  onChanged: (value) {
                    wkmctrl.onChangeSubscription(type, value);
                  },
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
