import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/model/qurandata.dart';
import 'package:quranlife/features/view/home/quraan%20page/ayah%20search/ayah_search.dart';
import 'package:quranlife/features/view/home/quraan%20page/saved%20ayahs/saved_ayahs.dart';
import 'package:quranlife/features/view/home/quraan%20page/widgets/ayah_widget.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
  final int? initialAyahNumber;

  const SurahPage({
    required this.surah,
    this.initialAyahNumber,
    super.key,
  });

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialAyahNumber != null) {
        _scrollToAyah(widget.initialAyahNumber!);
      }
    });
  }

  void _scrollToAyah(int ayahNumber) {
    final double targetOffset = (ayahNumber - 1);
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor:
              Get.isDarkMode ? kmaincolor2dark : const Color(0xFFF0E9CD),
          title: Text(
            widget.surah.name,
            style: const TextStyle(
              fontFamily: 'UthmanicHafs',
            ),
          ),
          foregroundColor: kmaincolor4,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => SavedAyahs());
                    },
                    icon: const Icon(Icons.bookmarks))),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const AyahSearch());
                    },
                    icon: const Icon(Icons.search_rounded))),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 3),
              _surahCard(),
              const SizedBox(height: 6),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.surah.ayahs.length,
                itemBuilder: (context, index) {
                  int surahNumber = widget.surah.number;
                  String surahName = widget.surah.name;
                  String ayahText = widget.surah.ayahs[index].text;
                  int ayahNumber = widget.surah.ayahs[index].number;
                  int ayahNumberInSurah =
                      widget.surah.ayahs[index].numberInSurah;
                  return AyahWidget(
                      titlevisibility: false,
                      surahNumber: surahNumber,
                      ayahNumber: ayahNumber,
                      ayahText: ayahText,
                      surahName: surahName,
                      ayahNumberInSurah: ayahNumberInSurah);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _surahCard() {
    return Card(
      elevation: 10,
      color: Colors.transparent,
      child: SizedBox(
        height: Sizeconfig.screenheight! / 2.2,
        width: Sizeconfig.screenwidth! / 1.12,
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
              width: Sizeconfig.screenwidth! / 1.12,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: kmaincolor4.withOpacity(0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  _cardtext(widget.surah.name, 29),
                  _cardtext(
                      '${widget.surah.revelationType.tr}, ${widget.surah.ayahs.length} ${"verses".tr}',
                      20),
                  const Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: Sizeconfig.screenheight! / 8,
                    width: Sizeconfig.screenwidth! / 1.2,
                    child: Image.asset(
                      "lib/core/assets/images/background_image/isti3ada.png",
                      fit: BoxFit.contain,
                      color: Colors.white,
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
                        color: Colors.white,
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
        color: Colors.white,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
