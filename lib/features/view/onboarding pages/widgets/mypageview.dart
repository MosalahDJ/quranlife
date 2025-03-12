import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key, this.imageasset, this.title, this.subtitle});
  final String? imageasset;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: SizedBox(
            height: Sizeconfig.screenheight! / 2.5,
            width: Sizeconfig.screenwidth,
            child: Image.asset(imageasset!),
          ),
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: SizedBox(
            width: Sizeconfig.screenwidth,
            child: Text(
              textAlign: TextAlign.center,
              title!,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : kmaincolor,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
