import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class JuzuaViewPage extends StatelessWidget {
  JuzuaViewPage({
    required this.backround,
    super.key,
  });

  final Widget backround;

  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //gradient background

        backround,

        //front of page

        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),

            //Listviewbuilder
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) => Column(
                children: [
                  // We replaced the Container with Material because it allows
                  // the button's overlay color to appear in the area where
                  // there is a gradient in the background.

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},

                      // It is preferable to use Ink with InkWell because it
                      //separates the design from the logic and also provides a
                      //better experience than using Container directly, as it is
                      //specifically designed for this purpose.

                      child: Ink(
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? kmaincolor2dark.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: Sizeconfig.screenheight! / 15,
                          width: Sizeconfig.screenwidth! / 1.05,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Text("juz".tr + " ${index + 1}"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizeconfig.screenheight! / 80),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
