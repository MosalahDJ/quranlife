import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:project/features/controller/quraan%20controller/saving_controller.dart';
import 'package:project/features/model/qurandata.dart';
import 'package:project/features/view/home/quraan%20page/widgets/ayah_widget.dart';

/// A page that displays a complete Surah with its verses
class SurahPage extends StatefulWidget {
  final Surah surah;
  final int? initialAyahNumber;

  const SurahPage({required this.surah, this.initialAyahNumber, super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  // === Properties ===
  final Map<int, GlobalKey> _ayahKeys = {};
  final ScrollController _scrollController = ScrollController();
  final QuraanController _quranController = Get.find();

  Surah? nextSurah;

  // === Lifecycle Methods ===
  @override
  void initState() {
    super.initState();
    _setupAyahKeys();
    _setupScrollController();
    nextSurah = _quranController.getNextSurah(widget.surah.number);

    // Scroll to specific ayah if provided
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialAyahNumber != null) {
        _scrollToAyah(widget.initialAyahNumber! - 1);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // === Setup Methods ===
  /// Creates global keys for each ayah to enable scrolling to specific verses
  void _setupAyahKeys() {
    for (int i = 0; i < widget.surah.ayahs.length; i++) {
      _ayahKeys[i] = GlobalKey();
    }
  }

  /// Configures scroll controller with pagination logic
  void _setupScrollController() {
    _scrollController.addListener(() {
      _quranController.handleScroll(
        _scrollController.position.pixels,
        _scrollController.position.maxScrollExtent + 150,
        widget.surah.number,
      );
    });
  }

  /// Scrolls to a specific ayah by index
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

  // === Build Methods ===
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Get.isDarkMode ? kmaincolor2dark : Colors.transparent,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  // === UI Components ===
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Get.isDarkMode ? kmaincolor2dark : Colors.transparent,
      title: Text(
        widget.surah.name,
        style: const TextStyle(fontFamily: 'UthmanicHafs'),
      ),
      foregroundColor: Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildBackgroundImage(),
        SafeArea(
          child:
              _quranController.isLoadingNextSurah.value
                  ? const CircularProgressIndicator()
                  : SingleChildScrollView(
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
    );
  }

  Widget _buildBackgroundImage() {
    return SizedBox(
      height: Sizeconfig.screenheight,
      width: Sizeconfig.screenwidth,
      child: Image.asset(
        "lib/core/assets/images/background_image/paper.jpg",
        fit: BoxFit.cover,
        opacity: AlwaysStoppedAnimation<double>(Get.isDarkMode ? 0.1 : 1),
        height: Sizeconfig.screenheight,
        width: Sizeconfig.screenwidth,
      ),
    );
  }

  // === Surah Content Widgets ===
  Card _surahCard() {
    return Card(
      elevation: 5,
      color: Colors.transparent,
      child: SizedBox(
        height: Sizeconfig.screenheight! / 2.2,
        width: Sizeconfig.screenwidth! / 1.05,
        child: Stack(
          children: [_buildSurahCardBackground(), _buildSurahCardContent()],
        ),
      ),
    );
  }

  Widget _buildSurahCardBackground() {
    return Positioned(
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
    );
  }

  Widget _buildSurahCardContent() {
    return Container(
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
          _buildDivider(),
          _buildIsti3adaImage(),
          if (widget.surah.number != 9 && widget.surah.number != 1)
            _buildBasmalaImage(),
        ],
      ),
    );
  }

  // === Helper Widgets ===
  Widget _buildDivider() {
    return Divider(
      endIndent: 40,
      indent: 40,
      thickness: 1,
      color: Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
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

  Widget _buildIsti3adaImage() {
    return SizedBox(
      height: Sizeconfig.screenheight! / 8,
      width: Sizeconfig.screenwidth! / 1.2,
      child: Image.asset(
        "lib/core/assets/images/background_image/isti3ada.png",
        fit: BoxFit.contain,
        color: Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
      ),
    );
  }

  Widget _buildBasmalaImage() {
    return SizedBox(
      height: Sizeconfig.screenheight! / 8,
      width: Sizeconfig.screenwidth! / 1.2,
      child: Image.asset(
        "lib/core/assets/images/background_image/basmala.png",
        fit: BoxFit.contain,
        color: Get.isDarkMode ? Colors.white : const Color(0xFF280F01),
      ),
    );
  }

  Widget _ayahsList() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(widget.surah.ayahs.length, (index) {
        final ayah = widget.surah.ayahs[index];
        return GetBuilder<SavingController>(
          builder:
              (c) => AyahWidget(
                savedvisibility: true,
                favoritevisibility: true,
                key: _ayahKeys[index],
                titlevisibility: false,
                surahNumber: widget.surah.number,
                ayahNumber: ayah.number,
                ayahText: ayah.text,
                surahName: widget.surah.name,
                ayahNumberInSurah: ayah.numberInSurah,
                ayahaudio: ayah.audio,
              ),
        );
      }),
    );
  }

  Widget _nextSurahIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "استمر في التمرير للانتقال الى\n${nextSurah!.name}",
            style: const TextStyle(fontFamily: 'UthmanicHafs', fontSize: 16),
          ),
        ],
      ),
    );
  }
}
