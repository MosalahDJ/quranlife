import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/onboarding%20pages/widgets/mypageview.dart';

class CusstomPageView extends StatelessWidget {
  const CusstomPageView({
    super.key,
    required this.pagecontroller,
  });

  final PageController pagecontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenheight! / 1.4,
      width: Sizeconfig.screenwidth,
      child: PageView(
        controller: pagecontroller,
        children: const [
          //I made a class and named it MyPageView it has the page viw body
          //and i caled it her for every page in this pageview
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding1.png",
            subtitle:
                "Your daily Islamic companion to strengthen your faith and practice Quranic teachings in your daily life.",
            title: "Welcome to Quran Life",
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding2.png",
            subtitle:
                "Quran Life reminds you of prayer times and provides you with dhikr and duas, ensuring you fulfill your religious obligations on time.",
            title: "Prayer Times & Reminders",
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding3.png",
            subtitle:
                "Quran Life supports all believers in maintaining their prayers, providing guidance and appropriate duas for every occasion.",
            title: "For Every Muslim",
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding4.png",
            subtitle:
                "Quran Life helps you locate nearby mosques and connects you with your brothers and sisters in faith.",
            title: "Islamic Community",
          ),
        ],
      ),
    );
  }
}
