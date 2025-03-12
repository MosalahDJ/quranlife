import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/model/qurandata.dart';
import 'package:project/features/view/home/quraan%20page/widgets/ayah_widget.dart';

class NextSurahPage extends StatefulWidget {
  final Surah surah;
  final int? initialAyahNumber;

  const NextSurahPage({required this.surah, this.initialAyahNumber, super.key});

  @override
  State<NextSurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<NextSurahPage> {
  final Map<int, GlobalKey> _ayahKeys = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Create GlobalKeys for each ayah
    for (int i = 0; i < widget.surah.ayahs.length; i++) {
      _ayahKeys[i] = GlobalKey();
    }

    // Scroll to initial ayah after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialAyahNumber != null) {
        _scrollToAyah(widget.initialAyahNumber! - 1);
      }
    });
  }

  void _scrollToAyah(int index) {
    if (_ayahKeys.containsKey(index)) {
      //we use Scrollable.ensureVisible in place of scrollController.animateTo
      //for scrolling to real position of aya with its context
      //we must use statefullwidget to use Scrollable
      Scrollable.ensureVisible(
        _ayahKeys[index]!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1, // Align verse 10% from top
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Get.isDarkMode ? kmaincolor2dark : Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor:
              Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
          title: Text(
            widget.surah.name,
            style: const TextStyle(fontFamily: 'UthmanicHafs'),
          ),
          foregroundColor:
              Get.isDarkMode
                  ? const Color(0xFFE8D2C6)
                  : const Color(0xFF280F01),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: Sizeconfig.screenheight,
              width: Sizeconfig.screenwidth,
              child: Image.asset(
                "lib/core/assets/images/background_image/paper.jpg",
                fit: BoxFit.cover,
                opacity: AlwaysStoppedAnimation<double>(
                  Get.isDarkMode ? 0.1 : 1,
                ),
                height: Sizeconfig.screenheight,
                width: Sizeconfig.screenwidth,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 3),
                    _surahCard(),
                    const SizedBox(height: 10),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(widget.surah.ayahs.length, (
                        index,
                      ) {
                        final ayah = widget.surah.ayahs[index];
                        return AyahWidget(
                          savedvisibility: true,
                          favoritevisibility: true,
                          key: _ayahKeys[index],
                          titlevisibility: false,
                          surahNumber: widget.surah.number,
                          ayahNumber: ayah.number,
                          ayahText: ayah.text,
                          surahName: widget.surah.name,
                          ayahNumberInSurah: ayah.numberInSurah,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Card _surahCard() {
    return Card(
      elevation: 5,
      color: Colors.transparent,
      child: SizedBox(
        height: Sizeconfig.screenheight! / 2.2,
        width: Sizeconfig.screenwidth! / 1.05,
        child: Stack(
          children: [
            Positioned(
              top: Sizeconfig.screenheight! / 35,
              left: Sizeconfig.screenwidth! / 5,
              right: -80,
              bottom: -50,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  "lib/core/assets/images/background_image/6221013cR.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: Sizeconfig.screenheight! / 2.2,
              width: Sizeconfig.screenwidth! / 1.05,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: kmaincolor4.withValues(alpha: 0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 5),
                  _cardtext(widget.surah.name, 29),
                  _cardtext(
                    '${widget.surah.revelationType.tr}, ${widget.surah.ayahs.length} ${"verses".tr}',
                    20,
                  ),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 1,
                    color:
                        Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 8,
                    width: Sizeconfig.screenwidth! / 1.2,
                    child: Image.asset(
                      "lib/core/assets/images/background_image/isti3ada.png",
                      fit: BoxFit.contain,
                      color:
                          Get.isDarkMode
                              ? Colors.white
                              : const Color(0xFF280F01),
                    ),
                  ),
                  Visibility(
                    visible:
                        widget.surah.number == 9 || widget.surah.number == 1
                            ? false
                            : true,
                    child: SizedBox(
                      height: Sizeconfig.screenheight! / 8,
                      width: Sizeconfig.screenwidth! / 1.2,
                      child: Image.asset(
                        "lib/core/assets/images/background_image/basmala.png",
                        fit: BoxFit.contain,
                        color:
                            Get.isDarkMode
                                ? Colors.white
                                : const Color(0xFF280F01),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _cardtext(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'UthmanicHafs',
        fontSize: size,
        height: 2,
        color: Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: const Color(0xFF280F01).withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
