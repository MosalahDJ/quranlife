import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/spalshview%20controller/splash_view_controller.dart';

class SplashViewBody extends StatelessWidget {
  SplashViewBody({super.key});

  final SplashViewController anctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: Sizeconfig.screenheight! / 3.5,
                width: Sizeconfig.screenwidth! / 1.2,
                child: Image.asset(
                    "lib/core/assets/images/splash_view_image/splashimage.png")),
            FadeTransition(
              opacity: anctrl.fadinganimation!,
              child: Text(
                "Quran Life",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? kmaincolor3 : kmaincolor3dark),
              ),
            ),
            const Text(
              "Please wait...",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
