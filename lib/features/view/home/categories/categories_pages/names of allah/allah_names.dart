import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/fetching%20data%20controller/allah_names_controller.dart';
import 'package:project/features/view/home/categories/categories_pages/names%20of%20allah/name_page.dart';

class AllahNames extends StatefulWidget {
  const AllahNames({super.key});

  @override
  State<AllahNames> createState() => _AllahNamesState();
}

class _AllahNamesState extends State<AllahNames> {
  @override
  Widget build(BuildContext context) {
    final allahnamesctrl = Get.find<AllahNamesController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: 'allah_names'.tr,
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
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Sizeconfig.screenwidth! * 0.05,
                vertical: 8,
              ),
              itemCount: allahnamesctrl.allahNames.length,
              itemBuilder:
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: LayoutBuilder(
                      builder:
                          (context, constraints) => InkWell(
                            onTap: () => Get.to(() => NamePage(id: i)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).cardColor.withValues(alpha: 0.7),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: kmaincolor.withValues(alpha: 0.5),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    allahnamesctrl.allahNames[i].name!,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.copyWith(
                                      fontFamily: "Amiri",
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
