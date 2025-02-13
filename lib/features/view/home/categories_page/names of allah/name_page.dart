import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/allah_names_controller.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key, required this.id});
  final int id;

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    final AllahNamesController allahnamesctrl = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: "${"hadith".tr} ${widget.id}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
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
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 0, left: 15, right: 15, top: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Duaa Content Container
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 28, 24, 20),
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
                                        allahnamesctrl
                                            .allahNames[widget.id - 1].name!,
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
                                      Text(
                                        allahnamesctrl
                                            .allahNames[widget.id - 1].text!,
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontFamily: "Cairo",
                                              height: 1.8,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.color
                                                  ?.withOpacity(0.87),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
