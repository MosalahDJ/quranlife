import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
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
        //appbar

        appBar: AppBar(
          centerTitle: true,
          title: const Text("Daily Supplications"),
          scrolledUnderElevation: 0,
        ),

        //Body

        body: Stack(children: [
          //gradient background

          Gradientbackground(
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          //front of page

          Positioned(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: AdkarCollections(
                adkarcategorycolor: Get.isDarkMode
                    ? kmaincolor2dark.withOpacity(0.5)
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ]));
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.9),
      itemCount: 10,
      itemBuilder: (context, i) => AdkarCategoryItem(
        adkarcategorycolor: adkarcategorycolor,
      ),
    );
  }
}
