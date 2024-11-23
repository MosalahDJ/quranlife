import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Auth%20controller/settingscontroller.dart';
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

            SettingsListTile(
              leading: const Icon(Icons.dark_mode),
              title: "dark mode",
              trailing: GetBuilder<Settingscontroller>(
                builder: (controller) {
                  return Switch(
                      activeColor: kmaincolor,
                      value: stgctrl.val,
                      onChanged: stgctrl.myswitch);
                },
              ),
            ),

            //Other settings list tile
            //here
          ],
        ),
      ),
    );
  }
}

//Settings List Tile

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {super.key,
      required this.leading,
      required this.trailing,
      required this.title});
  final Widget leading;
  final Widget trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "text",
          textAlign: TextAlign.start,
        ),
        ListTile(
          leading: leading,
          trailing: trailing,
          title: Text(
            title,
          ),
        ),
      ],
    );
  }
}
