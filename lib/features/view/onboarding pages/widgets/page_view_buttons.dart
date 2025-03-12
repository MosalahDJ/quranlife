import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/onboarding%20page%20controller/onboarding_pagecontroller.dart';

class PageViewbutton extends StatelessWidget {
  PageViewbutton({super.key});
  final OnboardingPagecontroller pageviewctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Sizeconfig.screenwidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: GetBuilder<OnboardingPagecontroller>(
          builder:
              (on) => Text(
                pageviewctrl.pagecontroller.page == 3
                    ? 'get_started'.tr
                    : 'next'.tr,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
        ),
      ),
    );
  }
}
