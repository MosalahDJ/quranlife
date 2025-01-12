import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
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
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          child: Text("daily_supplications".tr),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black45, Colors.black12],
            ).createShader(bounds),
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              "lib/core/assets/images/background_image/arch.jpg",
              fit: BoxFit.cover,
              height: Sizeconfig.screenheight,
              width: Sizeconfig.screenwidth,
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Choose a Category".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AdkarCollections(
                      adkarcategorycolor: Get.isDarkMode
                          ? kmaincolor2dark.withOpacity(0.7)
                          : Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
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
        child: AdkarCategoryItem(
          adkarcategorycolor: adkarcategorycolor,
        ),
      ),
    );
  }
}
