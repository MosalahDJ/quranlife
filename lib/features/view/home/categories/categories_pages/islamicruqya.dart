import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/islamic_ruqya_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';

class Islamicruqya extends StatefulWidget {
  const Islamicruqya({super.key});

  @override
  State<Islamicruqya> createState() => _IslamicruqyaState();
}

class _IslamicruqyaState extends State<Islamicruqya> {
  @override
  Widget build(BuildContext context) {
    final LanguageController langctrl = Get.find();
    final IslamicruqyaController ruqyactrl =
        Get.put<IslamicruqyaController>(IslamicruqyaController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: 'islamic_ruqyah'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/core/assets/images/background_image/arch.jpg'),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: Sizeconfig.screenwidth! * 0.05,
                vertical: 16,
              ),
              itemCount: ruqyactrl.islamicruqya.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: kmaincolor.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Duaa Content Container
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                          child: Column(
                            children: [
                              // Islamic Decoration
                              SizedBox(
                                height: Sizeconfig.screenheight! / 11,
                                width: Sizeconfig.screenwidth,
                                child: Image.asset(
                                  'lib/core/assets/images/background_image/islamic_separator.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Duaa Text
                              Text(
                                langctrl.language.value == "ar"
                                    ? ruqyactrl.islamicruqya[i].titlear!
                                    : langctrl.language.value == "fr"
                                        ? ruqyactrl.islamicruqya[i].titlefr!
                                        : ruqyactrl.islamicruqya[i].titleen!,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontFamily: "Amiri",
                                      height: 1.8,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color
                                          ?.withOpacity(0.87),
                                    ),
                              ),
                              // Description if exists
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[400]
                                      : kmaincolor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  langctrl.language.value == "ar"
                                      ? ruqyactrl.islamicruqya[i].descriptionar!
                                      : langctrl.language.value == "fr"
                                          ? ruqyactrl
                                              .islamicruqya[i].descriptionfr!
                                          : ruqyactrl
                                              .islamicruqya[i].descriptionen!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          height: 1.6,
                                          color: kmaincolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Cairo"),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              // source
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[400]
                                      : kmaincolor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "${"source".tr}:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              height: 1.6,
                                              color: kmaincolor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              fontFamily: "Cairo"),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Text(
                                      langctrl.language.value == "ar"
                                          ? ruqyactrl.islamicruqya[i].sourcear!
                                          : langctrl.language.value == "fr"
                                              ? ruqyactrl
                                                  .islamicruqya[i].sourcefr!
                                              : ruqyactrl
                                                  .islamicruqya[i].sourceen!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              height: 1.6,
                                              color: kmaincolor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: "Cairo"),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
