import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:quranlife/features/model/qurandata.dart';

class Surahviewpage extends StatelessWidget {
  Surahviewpage({
    required this.backround,
    super.key,
  });

  final Widget backround;

  final MyHomeController homectrl = Get.find();
  final QuraanController quranctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //gradient background

      backround,

      SizedBox(
        height: Sizeconfig.screenheight,
        width: Sizeconfig.screenwidth,
        child: Image.asset(
          "lib/core/assets/images/background_image/arch.jpg",
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation<double>(0.2),
          height: Sizeconfig.screenheight,
          width: Sizeconfig.screenwidth,
        ),
      ),
      //front of page

      Positioned(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2),

            //gridviewbuilder
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: quranctrl.surahs.length,
                itemBuilder: (context, index) {
                  final surah = quranctrl.surahs[index];

                  //surah name container
                  // We replaced the Container with Material because it allows
                  // the button's overlay color to appear in the area where
                  // there is a gradient in the background.

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () {},

                      // It is preferable to use Ink with InkWell because it
                      //separates the design from the logic and also provides a
                      //better experience than using Container directly, as it is
                      //specifically designed for this purpose.

                      child: Material(
                        elevation: 2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: Get.isDarkMode
                                ? kmaincolor2dark.withOpacity(0.7)
                                : Colors.white.withOpacity(0.7),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(08),
                            height: Sizeconfig.screenheight! / 15,
                            width: Sizeconfig.screenwidth! / 2.5,
                            alignment: Alignment.center,
                            child: Text(surah.name.tr),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    ]);
  }
}
