import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:quranlife/features/view/home/quraan%20page/saved_ayahs.dart';
import 'package:quranlife/features/view/home/quraan%20page/surah_page.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class QuraanPage extends StatelessWidget {
  QuraanPage({super.key});

  final MyHomeController homectrl = Get.find();
  final GoogleSignoutController signoutctrl = Get.find();

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
                        Get.to(() => SavedAyahs());
                      },
                      icon: const Icon(
                        Icons.bookmarks,
                        color: Colors.white,
                      ))),
            ],
            //TabBar
            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: kmaincolor4,
                indicatorColor: kmaincolor4,
                dividerColor: kmaincolor,
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
                ]),
          ),

          //Body

          body: TabBarView(children: [
            _surahviewPage(),
            _juzuaviewPage(),
            _ayahviewPage(),
          ])),
    );
  }
}

Widget _backround = Gradientbackground(
  gradientcolor: [
    kmaincolor,
    Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
  ],
);

Widget _surahviewPage() {
  final QuraanController quranctrl = Get.find();

  return Stack(children: [
    //gradient background
    _backround,
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
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: quranctrl.surahs.length,
              itemBuilder: (context, index) {
                final surah = quranctrl.surahs[index];

                //surah name container
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: () {
                      Get.to(
                        () => SurahPage(
                          surah: surah,
                        ),
                      );
                    },

                    // It is preferable to use Ink with InkWell
                    child: Material(
                      elevation: 2,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: Colors.transparent,
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: Get.isDarkMode
                              ? kmaincolor2dark.withOpacity(0.7)
                              : Colors.white.withOpacity(0.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                surah.name.tr,
                                style: TextStyle(
                                    fontFamily: "Amiri",
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              surah.revelationType == "Medinan"
                                  ? Icon(
                                      FlutterIslamicIcons.solidMinaret,
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    )
                                  : Icon(
                                      FlutterIslamicIcons.kaaba,
                                      color: Get.isDarkMode
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
              }),
        ),
      ),
    ),
  ]);
}

Widget _juzuaviewPage() {
  return Stack(
    children: [
      //gradient background
      _backround,
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

            //Listviewbuilder
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) => Column(
                children: [
                  // We replaced the Container with Material because it allows
                  // the button's overlay color to appear in the area where
                  // there is a gradient in the background.

                  Material(
                    elevation: 2,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},

                      // It is preferable to use Ink with InkWell because it
                      //separates the design from the logic and also provides a
                      //better experience than using Container directly, as it is
                      //specifically designed for this purpose.

                      child: Ink(
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? kmaincolor2dark.withOpacity(0.7)
                              : Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          height: Sizeconfig.screenheight! / 15,
                          width: Sizeconfig.screenwidth! / 1.05,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Text("${"juz".tr} ${index + 1}"),
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
      ),
    ],
  );
}

Widget _ayahviewPage() {
  final MyHomeController homectrl = Get.find();

  return Stack(children: [
    //gradient background
    _backround,
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
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Form(
                    child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 229, 240, 219),
                  focusNode: homectrl.searchfnode,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 229, 240, 219),
                      fontSize: 15,
                      fontFamily: "Poppins-Black"),
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: "search_verses".tr,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 219, 239, 201),
                          fontSize: 15)),
                )),
                SizedBox(
                  height: Sizeconfig.screenheight! / 40,
                ),
                SizedBox(
                  height: Sizeconfig.screenheight! / 1.6,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => const Text("data"),
                  ),
                )
              ],
            )),
      ),
    ),
  ]);
}
