import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:project/features/controller/quraan%20controller/juzua_controller.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:project/features/view/home/quraan%20page/favorite.dart';
import 'package:project/features/view/home/quraan%20page/saved_ayahs.dart';
import 'package:project/features/view/home/quraan%20page/surah_page.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';

class QuraanPage extends StatelessWidget {
  QuraanPage({super.key});

  final MyHomeController homectrl = Get.find();
  final FadeAnimationController fadectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kmaincolor,
          title: ShimmerText(
            text: "holy_quran".tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  homectrl.unfocuskeyboardhome();
                  Get.to(() => const SavedAyahs());
                },
                icon: const Icon(Icons.bookmarks, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  homectrl.unfocuskeyboardhome();
                  Get.to(() => Favorite());
                },
                icon: const Icon(Icons.favorite, color: Colors.white),
              ),
            ),
          ],
          //TabBar
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: kmaincolor4,
            indicatorColor: kmaincolor4,
            dividerColor: kmaincolor,
            onTap: (value) => homectrl.unfocuskeyboardhome(),
            tabs: [
              Tab(
                icon: const Icon(FlutterIslamicIcons.quran),
                child: Text("surah".tr),
              ),
              Tab(
                icon: const Icon(FlutterIslamicIcons.quran),
                child: Text("juz".tr),
              ),
              Tab(
                icon: const Icon(FlutterIslamicIcons.quran),
                child: Text("verse".tr),
              ),
            ],
          ),
        ),

        //Body
        body: TabBarView(
          children: [_surahviewPage(), _juzuaviewPage(), _ayahviewPage()],
        ),
      ),
    );
  }
}

Widget _backround() {
  return GetBuilder<QuraanController>(
    builder:
        (controller) => Gradientbackground(
          gradientcolor: [
            kmaincolor,
            Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
          ],
        ),
  );
}

//________________________________________________________________________________________________
//surahviewpage
//________________________________________________________________________________________________
Widget _surahviewPage() {
  final QuraanController quranctrl = Get.find();

  return Stack(
    children: [
      //gradient background
      _backround(),
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
            child: FadeIn(
              duration: const Duration(seconds: 1),
              animate: true,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: quranctrl.surahs.length,
                itemBuilder: (context, index) {
                  final surah = quranctrl.surahs[index];

                  //surah name container
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () {
                        Get.to(() => SurahPage(surah: surah));
                      },

                      // It is preferable to use Ink with InkWell
                      child: Material(
                        elevation: 2,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color:
                                Get.isDarkMode
                                    ? kmaincolor2dark.withValues(alpha: 0.7)
                                    : Colors.white.withValues(alpha: 0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 30,
                            ),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  surah.name.tr,
                                  style: TextStyle(
                                    fontFamily: "Amiri",
                                    color:
                                        Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                surah.revelationType == "Medinan"
                                    ? Icon(
                                      FlutterIslamicIcons.solidMinaret,
                                      color:
                                          Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                    )
                                    : Icon(
                                      FlutterIslamicIcons.kaaba,
                                      color:
                                          Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

//________________________________________________________________________________________________
//Juzuaviewpage
//________________________________________________________________________________________________

Widget _juzuaviewPage() {
  final QuraanController quranctrl = Get.find();

  final JuzuaController juzuactrl = Get.put(JuzuaController());

  return Stack(
    children: [
      //gradient background
      _backround(),
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
      Positioned(
        child: SafeArea(
          child: FadeIn(
            duration: const Duration(seconds: 1),
            animate: true,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: juzuactrl.juzData.length,
                itemBuilder: (context, index) {
                  final juzNumber = index + 1;
                  final juzStart = juzuactrl.juzData[juzNumber]!;
                  final ayahstart = juzStart[1];
                  final surah = quranctrl.getSurahByNumber(juzStart[0]);

                  return Column(
                    children: [
                      Material(
                        elevation: 2,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Get.to(
                              () => SurahPage(
                                surah: surah,
                                initialAyahNumber: juzStart[1],
                              ),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color:
                                  Get.isDarkMode
                                      ? kmaincolor2dark.withValues(alpha: 0.7)
                                      : Colors.white.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              height: Sizeconfig.screenheight! / 13,
                              width: Sizeconfig.screenwidth! / 1.05,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${"الجزء"} $juzNumber",
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontFamily: "Amiri",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    surah!.name,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontFamily: "Amiri",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    "${"الآية"} $ayahstart",
                                    style: const TextStyle(
                                      fontFamily: "Amiri",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Sizeconfig.screenheight! / 80),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

//________________________________________________________________________________________________
//ayahviewpage
//________________________________________________________________________________________________

Widget _ayahviewPage() {
  return Stack(
    children: [
      //gradient background
      _backround(),
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
          child: FadeIn(
            duration: const Duration(seconds: 1),
            animate: true,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2),

              //gridviewbuilder
              child: _searchWidget(),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _searchWidget() {
  final QuraanController quranctrl = Get.find();

  final MyHomeController homectrl = Get.find();

  return Container(
    decoration: const BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black12 : Colors.white10,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white24 : Colors.black12,
              ),
            ),
            child: TextField(
              focusNode: homectrl.searchfnode,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              onChanged: quranctrl.searchQuran,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black87,
                fontFamily: 'UthmanicHafs',
              ),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                fillColor:
                    Get.isDarkMode
                        ? kmaincolor3dark.withValues(alpha: 0.5)
                        : Colors.white,
                filled: true,
                hintText: 'search'.tr,
                hintStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                  fontFamily: 'UthmanicHafs',
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () =>
                quranctrl.isSearching.value
                    ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF280F01),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: quranctrl.searchResults.length,
                      itemBuilder: (context, index) {
                        final result = quranctrl.searchResults[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Get.isDarkMode
                                      ? Colors.black12
                                      : Colors.white.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color:
                                    Get.isDarkMode
                                        ? Colors.white24
                                        : Colors.black12,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              titleAlignment: ListTileTitleAlignment.center,
                              title: Text(
                                result['ayahText'],
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'UthmanicHafs',
                                  fontSize: 18,
                                  color:
                                      Get.isDarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '${result['surahName']} - ${result['ayahNumber']}',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: 'UthmanicHafs',
                                    color:
                                        Get.isDarkMode
                                            ? Colors.white70
                                            : Colors.black54,
                                  ),
                                ),
                              ),
                              onTap:
                                  () => Get.to(
                                    () => SurahPage(
                                      surah:
                                          quranctrl.getSurahByNumber(
                                            result['surahNumber'],
                                          )!,
                                      initialAyahNumber: result['ayahNumber'],
                                    ),
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ),
      ],
    ),
  );
}
