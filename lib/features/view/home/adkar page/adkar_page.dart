import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/view/home/adkar%20page/widgets/adkarcategoryitem.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class AdkarPage extends StatelessWidget {
  AdkarPage({super.key});
  final MyHomeController homectrl = Get.find();
  final GoogleSignoutController signoutctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
            text: "daily_supplications".tr,
            style: Theme.of(context).textTheme.headlineSmall),
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
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 2.0),
              child: AdkarCollections(
                adkarcategorycolor: Get.isDarkMode
                    ? kmaincolor2dark.withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdkarCollections extends StatelessWidget {
  const AdkarCollections({
    super.key,
    required this.adkarcategorycolor,
  });

  final Color adkarcategorycolor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: MediaQuery.of(context).size.width > 600 ? 1.2 : 0.95,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => Hero(
        tag: 'adkar_category_$index',
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
          elevation: 2,
          child: AdkarCategoryItem(
            adkarcategorycolor: adkarcategorycolor,
          ),
        ),
      ),
    );
  }
}
