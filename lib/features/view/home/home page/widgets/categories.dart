import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class ServiceCategorie extends StatelessWidget {
  ServiceCategorie({super.key});

  final ExpansionTileController expansionTileController =
      ExpansionTileController();
  final GlobalKey<State<StatefulWidget>> _expansionTileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: const EdgeInsets.all(0),
      childrenPadding: const EdgeInsets.all(0),
      key: _expansionTileKey,
      controller: expansionTileController,
      controlAffinity: ListTileControlAffinity.trailing,
      expansionAnimationStyle: AnimationStyle(
          curve: const FlippedCurve(Curves.ease),
          duration: const Duration(milliseconds: 500)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          categoryTitle(() {}, Icons.message),
          categoryTitle(() {}, Icons.message_outlined),
          categoryTitle(() {}, Icons.explore),
        ],
      ),
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mycategory(
                  () {},
                  FlutterIslamicIcons.allah,
                ),
                mycategory(
                  () {},
                  FlutterIslamicIcons.hadji,
                ),
                mycategory(
                  () {
                    Get.toNamed("hijri");
                  },
                  FlutterIslamicIcons.calendar,
                ),
                mycategory(
                  () {},
                  FlutterIslamicIcons.family,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mycategory(
                  () {},
                  FlutterIslamicIcons.allah,
                ),
                mycategory(
                  () {},
                  FlutterIslamicIcons.hadji,
                ),
                mycategory(
                  () {
                    Get.toNamed("hijri");
                  },
                  FlutterIslamicIcons.calendar,
                ),
                mycategory(
                  () {},
                  FlutterIslamicIcons.community,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mycategory(
                  () {},
                  FlutterIslamicIcons.allah,
                ),
                mycategory(
                  () {},
                  FlutterIslamicIcons.hadji,
                ),
                mycategory(
                  () {
                    Get.toNamed("hijri");
                  },
                  FlutterIslamicIcons.calendar,
                ),
                mycategory(
                  () {},
                  FlutterIslamicIcons.community,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

Widget mycategory(ontap, categoryicon) {
  return InkWell(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
    onTap: ontap,
    child: GetBuilder<MyHomeController>(
      builder: (_) => Card(
        color: Get.isDarkMode
            ? kmaincolor2dark.withOpacity(0.5)
            : Colors.white.withOpacity(0.7),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: Icon(
                  size: 30,
                  categoryicon,
                  color: Get.isDarkMode ? textcolor3dark : textcolor1,
                )),
            const Text("Icon name")
          ],
        ),
      ),
    ),
  );
}

Widget categoryTitle(ontap, icon) {
  return InkWell(
    onTap: ontap,
    child: GetBuilder<MyHomeController>(
      builder: (_) => Card(
        color: Get.isDarkMode
            ? kmaincolor2dark.withOpacity(0.5)
            : Colors.white.withOpacity(0.7),
        child: Container(
            width: Sizeconfig.screenwidth! / 5.5,
            margin: const EdgeInsets.all(10),
            child: Icon(
              icon,
              size: 30,
              color: Get.isDarkMode ? textcolor3dark : textcolor1,
            )),
      ),
    ),
  );
}
