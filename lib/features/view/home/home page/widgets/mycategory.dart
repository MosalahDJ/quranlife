import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class MyCategory extends StatelessWidget {
  MyCategory({super.key, required this.categoryicon, required this.ontap});

  final IconData categoryicon;
  final MyHomeController homectrl = Get.find();
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          InkWell(
            onTap: ontap,
            child: GetBuilder<MyHomeController>(
              builder: (_) => Card(
                color: Get.isDarkMode
                    ? kmaincolor2dark.withOpacity(0.5)
                    : Colors.white.withOpacity(0.5),
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Icon(
                      size: 30,
                      categoryicon,
                      color: Get.isDarkMode ? textcolor3dark : textcolor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
