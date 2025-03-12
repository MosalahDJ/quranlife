import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/adkar%20controller/adkar_categories_controller.dart';
import 'package:project/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:project/features/view/home/adkar%20page/widgets/duaa_page.dart';

class AdkarPage extends StatelessWidget {
  AdkarPage({super.key});
  final FadeAnimationController fadectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        centerTitle: true,
        title: ShimmerText(
          text: "daily_supplications".tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Image.asset(
            "lib/core/assets/images/background_image/arch.jpg",
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation<double>(0.2),
            height: Sizeconfig.screenheight,
            width: Sizeconfig.screenwidth,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 2.0,
              ),
              child: FadeInUp(
                child: AdkarCollections(
                  adkarcategorycolor:
                      Get.isDarkMode
                          ? kmaincolor2dark.withValues(alpha: 0.7)
                          : Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdkarCollections extends StatelessWidget {
  AdkarCollections({super.key, required this.adkarcategorycolor});

  final Color adkarcategorycolor;
  final AdkarCategoriesController _adkartypectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: _adkartypectrl.adkartype.length,
      itemBuilder:
          (context, index) => Hero(
            tag: 'adkar_category_$index',
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              elevation: 2,
              child: GetBuilder<AdkarCategoriesController>(
                builder:
                    (_) => adkarcategorieitem(
                      adkarcategorycolor,
                      _adkartypectrl.adkartype[index].name!,
                      _adkartypectrl.adkartype[index].id!,
                      _adkartypectrl.adkartype[index].id! == 1
                          ? "lib/core/assets/images/adkar_icons/morning.png"
                          : _adkartypectrl.adkartype[index].id! == 2
                          ? "lib/core/assets/images/adkar_icons/evening.png"
                          : _adkartypectrl.adkartype[index].id! == 3
                          ? "lib/core/assets/images/adkar_icons/getup.png"
                          : _adkartypectrl.adkartype[index].id! == 4
                          ? "lib/core/assets/images/adkar_icons/wudu.png"
                          : _adkartypectrl.adkartype[index].id! == 5
                          ? "lib/core/assets/images/adkar_icons/sleeping.png"
                          : _adkartypectrl.adkartype[index].id! == 6
                          ? "lib/core/assets/images/adkar_icons/praying.png"
                          : _adkartypectrl.adkartype[index].id! == 7
                          ? "lib/core/assets/images/adkar_icons/adan.png"
                          : _adkartypectrl.adkartype[index].id! == 8
                          ? "lib/core/assets/images/adkar_icons/masjid.webp"
                          : _adkartypectrl.adkartype[index].id! == 9
                          ? "lib/core/assets/images/adkar_icons/home.png"
                          : _adkartypectrl.adkartype[index].id! == 10
                          ? "lib/core/assets/images/adkar_icons/bathroom.png"
                          : _adkartypectrl.adkartype[index].id! == 11
                          ? "lib/core/assets/images/adkar_icons/food.webp"
                          : _adkartypectrl.adkartype[index].id! == 12
                          ? "lib/core/assets/images/adkar_icons/travel.png"
                          : _adkartypectrl.adkartype[index].id! == 13
                          ? "lib/core/assets/images/adkar_icons/after_praying.png"
                          : "lib/core/assets/images/adkar_icons/other.png",
                    ),
              ),
            ),
          ),
    );
  }
}

Widget adkarcategorieitem(
  Color adkarcategorycolor,
  String adkartype,
  int duaaID,
  String iconpath,
) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onTap:
          () => Get.to(
            () => DuaaPage(duaapagename: adkartype, duaapageID: duaaID),
          ),
      child: Ink(
        decoration: BoxDecoration(
          color: adkarcategorycolor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Sizeconfig.screenheight! / 17,
              width: Sizeconfig.screenwidth! / 7,
              child: Image.asset(
                opacity: const AlwaysStoppedAnimation<double>(0.7),
                iconpath,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            Text(
              adkartype.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color:
                    Get.isDarkMode
                        ? const Color(0xFFFFF6D2)
                        : const Color(0xFF030C02),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
