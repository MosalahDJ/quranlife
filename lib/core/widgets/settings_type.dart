import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          style: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        Column(children: listwidget),
      ],
    );
  }
}