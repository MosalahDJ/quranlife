import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/cusstom_indicator.dart';
import 'package:project/features/controller/onboarding%20page%20controller/onboarding_pagecontroller.dart';
import 'package:project/features/view/auth/login%20page/loginpage.dart';
import 'package:project/features/view/onboarding%20pages/widgets/cusstom_page_view.dart';
import 'package:project/features/view/onboarding%20pages/widgets/page_view_buttons.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});

  final OnboardingPagecontroller pageviewctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Sizeconfig.screenheight,
            width: Sizeconfig.screenwidth,
            child: Stack(
              children: [
                Positioned(
                  top: Sizeconfig.screenheight! / 10,
                  right: Sizeconfig.screenwidth! / 25,
                  left: Sizeconfig.screenwidth! / 25,
                  child: CusstomPageView(
                    pagecontroller: pageviewctrl.pagecontroller,
                  ),
                ),
                Positioned(
                  bottom: Sizeconfig.screenheight! / 5.2,
                  left: Sizeconfig.screenwidth! / 5,
                  right: Sizeconfig.screenwidth! / 5,
                  //we use the getbuilder for refreshing the ui page if the value
                  // changed
                  //also we use the get builder for skip the error of "cant build a
                  // page view controller before building the ui page"
                  //and we use the controller variable to get the value
                  //and we use the condition statment to make his value 0 if there
                  // is no value in controller
                  child: GetBuilder<OnboardingPagecontroller>(
                    builder:
                        (on) => CustomIndicator(
                          dotscolor:
                              Get.isDarkMode
                                  ? const Color(0xffFD9B63)
                                  : kmaincolor,
                          dotscount: 4,
                          indposition:
                              pageviewctrl.pagecontroller.page != null
                                  ? pageviewctrl.pagecontroller.page!.toInt()
                                  : 0,
                        ),
                  ),
                ),
                Positioned(
                  top: Sizeconfig.screenheight! / 8,
                  right: 32,
                  //we use the getbuilder for refreshing the ui page if the value
                  // changed
                  //also we use the get builder for skip the error of "cant build a
                  // page view controller before building the ui page"
                  //visability widget help us to make a widget invisible
                  child: GetBuilder<OnboardingPagecontroller>(
                    builder:
                        (on) => Visibility(
                          visible:
                              pageviewctrl.pagecontroller.page == 3
                                  ? false
                                  : true,
                          child: TextButton(
                            onPressed: () {
                              Get.offAllNamed("/login");
                            },
                            child: Text(
                              'skip'.tr,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  ),
                ),
                Positioned(
                  bottom: Sizeconfig.screenheight! / 10,
                  left: Sizeconfig.screenwidth! / 5,
                  right: Sizeconfig.screenwidth! / 5,
                  child: ElevatedButton(
                    onPressed: () {
                      pageviewctrl.currentPage == 3
                          //going to the new page
                          ? Get.offAll(
                            () => LoginPage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500),
                          )
                          //going to the next pageview
                          : pageviewctrl.pagecontroller.nextPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linear,
                          );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kmaincolor4),
                    ),
                    child: PageViewbutton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
