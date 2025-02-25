import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/settings_type.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/notfication%20controller/work_manager_controller.dart';

class NotificationSettings extends StatelessWidget {
  NotificationSettings({super.key});
  final WorkManagerController wkmctrl = Get.find();

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
          text: 'islamic_ruqyah'.tr,
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
          SafeArea(
            child: Settingtype(
              title: 'notifications'.tr,
              listwidget: [
                //adhan
                Obx(() => SwitchListTile(
                    title: Text('adhan_notifications'.tr,
                        style: const TextStyle(fontSize: 15)),
                    value: wkmctrl.adhansubscribition.value,
                    onChanged: (val) {
                      wkmctrl.adhansubscribition.value =
                          !wkmctrl.adhansubscribition.value;
                      wkmctrl.onChangeSubscription(NotificationType.adhan, val);
                    })),
                //adkhar
                Obx(() => SwitchListTile(
                    title: Text('adhkar_notifications'.tr,
                        style: const TextStyle(fontSize: 15)),
                    value: wkmctrl.adhkarsubscribition.value,
                    onChanged: (val) {
                      wkmctrl.adhkarsubscribition.value =
                          !wkmctrl.adhkarsubscribition.value;
                      wkmctrl.onChangeSubscription(
                          NotificationType.adhkar, val);
                    })),
                //quraan
                Obx(
                  () => SwitchListTile(
                    title: Text('quran_notifications'.tr,
                        style: const TextStyle(fontSize: 15)),
                    value: wkmctrl.quraansubscribition.value,
                    onChanged: (val) {
                      wkmctrl.quraansubscribition.value =
                          !wkmctrl.quraansubscribition.value;
                      wkmctrl.onChangeSubscription(
                          NotificationType.quraan, val);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
