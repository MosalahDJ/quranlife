import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/splash%20page/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);

    return Scaffold(
      backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
      body: SplashViewBody(),
    );
  }
}
