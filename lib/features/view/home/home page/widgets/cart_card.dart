import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/floating_animation_controllers/floating_animation_controller.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:project/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/view/home/map%20page/map_page.dart';

class CartCard extends StatelessWidget {
  CartCard({super.key, required this.color, required this.elevation});

  final Color color;
  final double elevation;

  final LocationController locationctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final LanguageController langctrl = Get.find();
  final MyHomeController homectrl = Get.find();
  final FloatingAnimationController fltanimtion = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //making stack widget responsive
      height:
          Sizeconfig.screenheight! < 768
              ? (langctrl.language.value == "fr"
                  ? Sizeconfig.screenheight! / 3
                  : Sizeconfig.screenheight! / 3.5)
              : (langctrl.language.value == "fr"
                  ? Sizeconfig.screenheight! / 3.7
                  : Sizeconfig.screenheight! / 4),
      child: Stack(
        children: [
          //card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 150,
            child: Card(
              elevation: 2,
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "mosque_finder_desc".tr,
                              style: TextStyle(
                                color:
                                    Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: Column()),
                  ],
                ),
              ),
            ),
          ),
          //masjid png image
          Positioned(
            right:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 2
                    : Sizeconfig.screenwidth! / 50,
            left:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 50
                    : Sizeconfig.screenwidth! / 2,
            bottom:
                Sizeconfig.screenheight! < 768
                    ? Sizeconfig.screenheight! / 50
                    : Sizeconfig.screenheight! / 150,
            child: fltanimtion.buildFloatingWidget(
              shadowOffset: -60,
              shadowHeight: 30,
              shadowWidth:
                  langctrl.language.value == "ar"
                      ? (Sizeconfig.screenwidth! / 2.4) -
                          (Sizeconfig.screenwidth! / 50)
                      : (Sizeconfig.screenwidth! / 2.2) -
                          (Sizeconfig.screenwidth! / 50),
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  "lib/core/assets/images/homeimages/masjid_map.png",
                  height: Sizeconfig.screenheight! / 4,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          //button for going to cart
          Positioned(
            bottom: Sizeconfig.screenheight! / 100,
            right:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 2.05
                    : Sizeconfig.screenwidth! / 40,
            left:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 40
                    : Sizeconfig.screenwidth! / 2.05,
            child: Card(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                onTap: () {
                  if (_isanonymous(context)) {
                    return;
                  }

                  Get.to(() => const MapSample());
                },
                child: SizedBox(
                  height:
                      Sizeconfig.screenheight! < 768
                          ? Sizeconfig.screenheight! / 15
                          : Sizeconfig.screenheight! / 20,
                  width: Sizeconfig.screenwidth! / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height:
                              Sizeconfig.screenheight! < 768
                                  ? Sizeconfig.screenheight! / 15
                                  : Sizeconfig.screenheight! / 20,
                          width: Sizeconfig.screenwidth! / 3.5,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              "find_mosque".tr,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 3
                    : 0,
            right:
                langctrl.language.value == "ar"
                    ? 0
                    : langctrl.language.value == "fr"
                    ? Sizeconfig.screenwidth! / 5
                    : Sizeconfig.screenwidth! / 4,
            child: Text(
              "search_for_a_mosque".tr,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          //morebutton
          Positioned(
            top: 3,
            left:
                langctrl.language.value == "ar"
                    ? 0
                    : Sizeconfig.screenwidth! / 1.25,
            right:
                langctrl.language.value == "ar"
                    ? Sizeconfig.screenwidth! / 1.25
                    : 0,
            child: IconButton(
              alignment: Alignment.center,
              onPressed: () {
                homectrl.showShareDialog(context);
              },
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool _isanonymous(context) {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null || currentUser.isAnonymous) {
    AwesomeDialog(
      context: context,
      title: 'anonymous_user'.tr,
      desc: 'guest_login_warning'.tr,
      dialogType: DialogType.error,
    ).show();
    return true;
  }
  return false;
}
