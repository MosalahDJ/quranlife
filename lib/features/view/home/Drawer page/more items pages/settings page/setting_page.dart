import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhkar_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/quraan_noti_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final AdhanNotiController adhanctrl = Get.find();
  final QuraanNotiController quraanctrl = Get.find();
  final Adhkarnoticontroller adhkarctrl = Get.find();
  final ThemeController stgctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Settings appbar

      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: kmaincolor,
      ),

      //Settings body
      body: Stack(
        children: [
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              //themedata list tile
              Settingtype(title: "Theme mode", listwidget: [
                Obx(
                  () => RadioListTile<AppTheme>(
                    title: const Text(
                      'Light Theme',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: AppTheme.light,
                    groupValue: stgctrl.selectedTheme.value,
                    onChanged: (value) {
                      stgctrl.changeTheme(value!);
                    },
                  ),
                ),
                Obx(
                  () => RadioListTile<AppTheme>(
                    title: const Text(
                      'Dark Theme',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: AppTheme.dark,
                    groupValue: stgctrl.selectedTheme.value,
                    onChanged: (value) {
                      stgctrl.changeTheme(value!);
                    },
                  ),
                ),
              ]),
              Settingtype(
                title: "Notifications",
                listwidget: [
                  //adhan
                  Obx(() => SwitchListTile(
                      title: const Text(
                        "Adhan notifications",
                        style: TextStyle(fontSize: 15),
                      ),
                      value: adhanctrl.adhansubscribition.value,
                      onChanged: (val) {
                        adhanctrl.adhansubscribition.value =
                            !adhanctrl.adhansubscribition.value;
                        // adhanctrl.onchangesubscribtion(val);
                      })),
                  //adkhar
                  Obx(() => SwitchListTile(
                      title: const Text(
                        "Adhkar notifications",
                        style: TextStyle(fontSize: 15),
                      ),
                      value: adhkarctrl.adhkarsubscribition.value,
                      onChanged: (val) {
                        adhkarctrl.adhkarsubscribition.value =
                            !adhkarctrl.adhkarsubscribition.value;
                        adhkarctrl.onchangesubscribtion(
                          val,
                        );
                      })),
                  //quraan
                  Obx(() => SwitchListTile(
                      title: const Text(
                        "Quraan notifications",
                        style: TextStyle(fontSize: 15),
                      ),
                      value: quraanctrl.quraansubscribition.value,
                      onChanged: (val) {
                        quraanctrl.quraansubscribition.value =
                            !quraanctrl.quraansubscribition.value;
                        quraanctrl.onchangesubscribtion(val);
                      })),
                  // //morning and evening adhkar
                  // Obx(() => SwitchListTile(
                  //     title: const Text(
                  //       "morning and evening adhkar notifications",
                  //       style: TextStyle(fontSize: 15),
                  //     ),
                  //     value: adhkarctrl.adhkarsubscribition.value,
                  //     onChanged: (val) {
                  //       val = !val;
                  //       quraanctrl.quraansubscribition.value =
                  //           !quraanctrl.quraansubscribition.value;
                  //       quraanctrl.onchangesubscribtion(val);
                  //     })),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       NotificationController.cancelAllNotification();
                  //     },
                  //     child: const Text("cancel all noti")),])
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}

//Settings List Tile

class Settingtype extends StatelessWidget {
  const Settingtype({super.key, required this.title, required this.listwidget});
  final String title;

  final List<Widget> listwidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Column(children: listwidget),
      ],
    );
  }
}
