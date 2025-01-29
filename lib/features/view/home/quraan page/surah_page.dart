import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:quranlife/features/model/qurandata.dart';
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
  final Map<int, GlobalKey> _ayahKeys = {};
  final ScrollController _scrollController = ScrollController();
  final QuraanController _quranController = Get.find();
  Surah? nextSurah;

  @override
  void initState() {
    super.initState();
    _setupAyahKeys();
    _setupScrollController();
    nextSurah = _quranController.getNextSurah(widget.surah.number);
    _quranController.resetSurahPageState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialAyahNumber != null) {
        _scrollToAyah(widget.initialAyahNumber! - 1);
      }
    });
  }

  void _setupScrollController() {
    _scrollController.addListener(() {
      _quranController.handleScroll(
        _scrollController.position.pixels,
        _scrollController.position.maxScrollExtent,
        widget.surah.number,
      );
    });
  }

  void _setupAyahKeys() {
    for (int i = 0; i < widget.surah.ayahs.length; i++) {
      _ayahKeys[i] = GlobalKey();
    }
  }

  void _scrollToAyah(int index) {
    if (_ayahKeys.containsKey(index)) {
      Scrollable.ensureVisible(
        _ayahKeys[index]!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1,
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
              Get.isDarkMode ? kmaincolor2dark : Colors.transparent,
          title: Text(
            widget.surah.name,
            style: const TextStyle(
              fontFamily: 'UthmanicHafs',
            ),
          ),
          foregroundColor: const Color(0xFF280F01),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: Sizeconfig.screenheight,
              width: Sizeconfig.screenwidth,
              child: Image.asset(
                "lib/core/assets/images/background_image/paper.jpg",
                fit: BoxFit.cover,
                opacity:
                    AlwaysStoppedAnimation<double>(Get.isDarkMode ? 0.1 : 1),
                height: Sizeconfig.screenheight,
                width: Sizeconfig.screenwidth,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 3),
                    _surahCard(),
                    const SizedBox(height: 10),
                    _ayahsList(),
                    if (nextSurah != null) _nextSurahIndicator(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ayahsList() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        widget.surah.ayahs.length,
        (index) {
          final ayah = widget.surah.ayahs[index];
          return AyahWidget(
            key: _ayahKeys[index],
            titlevisibility: false,
            surahNumber: widget.surah.number,
            ayahNumber: ayah.number,
            ayahText: ayah.text,
            surahName: widget.surah.name,
            ayahNumberInSurah: ayah.numberInSurah,
            ayahaudio: ayah.audio,
          );
        },
      ),
    );
  }

  Widget _nextSurahIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Obx(() {
            if (_quranController.showIndicator.value) {
              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      value: _quranController.isLoadingNextSurah.value
                          ? null
                          : _quranController.scrollProgress.value,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      color: Get.isDarkMode
                          ? Colors.white
                          : const Color(0xFF280F01),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }
            return const SizedBox.shrink();
          }),
          Text(
            nextSurah!.name,
            style: const TextStyle(
              fontFamily: 'UthmanicHafs',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _quranController.resetSurahPageState();
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
                      color: Get.isDarkMode
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
                        color: Get.isDarkMode
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
            color: const Color(0xFF280F01).withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
