import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/fetching%20data%20controller/allah_names_controller.dart';

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
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: allahnamesctrl.allahNames[widget.id].name!,
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
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 0,
                  left: 15,
                  right: 15,
                  top: 0,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: LayoutBuilder(
                    builder:
                        (context, constraints) => Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: kmaincolor.withValues(alpha: 0.08),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    24,
                                    28,
                                    24,
                                    20,
                                  ),
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
                                      Text(
                                        allahnamesctrl
                                            .allahNames[widget.id]
                                            .name!,
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.copyWith(
                                          fontFamily: "Amiri",
                                          height: 1.8,
                                          fontSize: 55,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.color
                                              ?.withValues(alpha: 0.87),
                                        ),
                                      ),
                                      //description
                                      Text(
                                        allahnamesctrl
                                            .allahNames[widget.id]
                                            .text!,
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.copyWith(
                                          fontFamily: "Cairo",
                                          height: 1.8,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.color
                                              ?.withValues(alpha: 0.87),
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
            ),
          ),
        ],
      ),
    );
  }
}
