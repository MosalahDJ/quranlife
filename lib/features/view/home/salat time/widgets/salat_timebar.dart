import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';

class Salattimebar extends StatelessWidget {
  const Salattimebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: ListTile(
        titleTextStyle: const TextStyle(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerText(
              text: "prayer_times".tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        //test button
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_applications_outlined,
              color: Colors.white,
            )),
      ),
    );
  }
}
