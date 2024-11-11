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
                "Your daily Islamic companion to strengthen your faith and practice Quranic teachings in your life",
            title: "Welcome to Quran Life",
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding2.png",
            subtitle:
                "Quran Life reminds you of prayer times, provides you with dhikr and duas, ensuring you perform your obligations on time",
            title: "Anytime, Anywhere",
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding3.png",
            subtitle:
                "Quran Life helps all believers stay committed to their prayers, providing guidance and appropriate duas for every moment",
            title: "for Every Muslim",
          ),
          MyPageView(
            imageasset:
                "lib/core/assets/images/on_boarding_image/onboarding4.png",
            subtitle:
                "Quran Life helps you find the nearest mosques, and connects you with your brothers and sisters in faith",
            title: "Islamic Community",
          ),
        ],
      ),
    );
  }
}
