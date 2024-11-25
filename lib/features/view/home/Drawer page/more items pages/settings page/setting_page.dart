import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/more%20controllers/settingscontroller.dart';
import 'package:quranlife/features/controller/notification%20controller/notification_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final NotificationController notictrl = Get.find();
  final Settingscontroller stgctrl = Get.find();

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //themedata list tile
            Settingtype(title: "Theme mode", listwidget: [
              Obx(
                () => RadioListTile<AppTheme>(
                  title: const Text('Light Theme'),
                  value: AppTheme.light,
                  groupValue: stgctrl.selectedTheme.value,
                  onChanged: (value) {
                    if (value != null) {
                      stgctrl.changeTheme(value);
                    }
                  },
                ),
              ),
              Obx(
                () => RadioListTile<AppTheme>(
                  title: const Text('Dark Theme'),
                  value: AppTheme.dark,
                  groupValue: stgctrl.selectedTheme.value,
                  onChanged: (value) {
                    if (value != null) {
                      stgctrl.changeTheme(value);
                    }
                  },
                ),
              ),
              Obx(
                () => RadioListTile<AppTheme>(
                  title: const Text('System Theme'),
                  value: AppTheme.system,
                  groupValue: stgctrl.selectedTheme.value,
                  onChanged: (value) {
                    if (value != null) {
                      stgctrl.changeTheme(value);
                    }
                  },
                ),
              ),
              //system mode
              // RadioListTile(
              //   value: Get.isPlatformDarkMode
              //       ? Themes().darkmode
              //       : Themes().lightmode,
              //   groupValue: stgctrl.themedata,
              //   onChanged: stgctrl.todevicetheme(Get.isPlatformDarkMode
              //       ? Themes().darkmode
              //       : Themes().lightmode),
              //   title: const Text("device theme"),
              // ),

              // //dark mode
              // RadioListTile(
              //   value: ThemeMode.dark,
              //   groupValue: stgctrl.themedata,
              //   onChanged: stgctrl.todarkmode(Themes().darkmode),
              //   title: const Text("Dark theme"),
              // ),

              // //light mode
              // RadioListTile(
              //   value: ThemeMode.light,
              //   groupValue: stgctrl.themedata,
              //   onChanged: stgctrl.tolightmode(Themes().lightmode),
              //   title: const Text("Light theme"),
              // ),
            ]),

            // SettingsListTile(
            //   leading: const Icon(Icons.dark_mode),
            //   title: "Theme mode",
            //   trailing: GetBuilder<Settingscontroller>(
            //     builder: (controller) {
            //       return Switch(
            //           activeColor: kmaincolor,
            //           value: stgctrl.val,
            //           onChanged: stgctrl.myswitch);
            //     },
            //   ),
            // // ),
            // ElevatedButton(
            //     onPressed: () {
            //       notictrl.subscribetotopic("adhan");
            //     },
            //     child: const Text("sbscribe")),
            // ElevatedButton(
            //     onPressed: () {
            //       notictrl.unsbscribefrometopic("adhan");
            //     },
            //     child: const Text("unsbscribe")),
            // ElevatedButton(
            //     onPressed: () {
            //       notictrl.sendmessage("adhan", "mytitle", "mybody", "adhan");
            //     },
            //     child: const Text("send")),
            //Other settings list tile
            //here
          ],
        ),
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
        ),
        Column(children: listwidget),
      ],
    );
  }
}
