import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/view/onboarding%20pages/widgets/mypageview.dart';

class CusstomPageView extends StatelessWidget {
  const CusstomPageView({super.key, required this.pagecontroller});

  final PageController pagecontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenheight! / 1.4,
      width: Sizeconfig.screenwidth,
      child: PageView(
        controller: pagecontroller,
        children: [
          //I made a class and named it MyPageView it has the page viw body
          //and i caled it her for every page in this pageview
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding1.png",
            subtitle: 'welcome_subtitle'.tr,
            title: 'welcome_title'.tr,
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding2.png",
            subtitle: 'prayer_times_subtitle'.tr,
            title: 'prayer_times_title'.tr,
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding3.png",
            subtitle: 'for_muslim_subtitle'.tr,
            title: 'for_muslim_title'.tr,
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding4.png",
            subtitle: 'community_subtitle'.tr,
            title: 'community_title'.tr,
          ),
        ],
      ),
    );
  }
}
