import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/adkar%20controller/adkar_categories_controller.dart';
import 'package:quranlife/features/view/home/adkar%20page/widgets/duaa_page.dart';

class AdkarPage extends StatelessWidget {
  const AdkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
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
  AdkarCollections({
    super.key,
    required this.adkarcategorycolor,
  });

  final Color adkarcategorycolor;
  final AdkarCategoriesController _adkartypectrl = Get.find();

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
      itemCount: _adkartypectrl.adkartype.length,
      itemBuilder: (context, index) => Hero(
        tag: 'adkar_category_$index',
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
          elevation: 2,
          child: GetBuilder<AdkarCategoriesController>(
              builder: (_) => adkarcategorieitem(
                  adkarcategorycolor,
                  _adkartypectrl.adkartype[index].name!,
                  _adkartypectrl.adkartype[index].id!)),
        ),
      ),
    );
  }
}

Widget adkarcategorieitem(
    Color adkarcategorycolor, String adkartype, int duaaID) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      overlayColor: WidgetStatePropertyAll(kmaincolor4),
      onTap: () => Get.to(() => DuaaPage(
            duaapageID: duaaID,
          )),
      child: Ink(
        decoration: BoxDecoration(
          color: adkarcategorycolor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "lib/core/assets/images/app_logo/pnglogo1.png",
                alignment: Alignment.topCenter,
              ),
            ),
            Text(
              adkartype,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}
