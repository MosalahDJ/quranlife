import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/view/home/adkar%20page/widgets/duaa_page.dart';

class AdkarCategoryItem extends StatelessWidget {
  AdkarCategoryItem({super.key, required this.adkarcategorycolor});

  final MyHomeController homectrl = Get.find();
  final Color adkarcategorycolor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHomeController>(
        builder: (_) => Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                overlayColor: WidgetStatePropertyAll(kmaincolor4),
                onTap: () => Get.to(() => DuaaPage()),
                child: Ink(
                  decoration: BoxDecoration(
                    color: adkarcategorycolor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          "lib/core/assets/images/app_logo/pnglogo1.png",
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Text(
                        "category_name".tr,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
