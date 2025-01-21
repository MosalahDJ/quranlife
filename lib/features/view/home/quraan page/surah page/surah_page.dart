import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/model/qurandata.dart';

class SurahPage extends StatelessWidget {
  const SurahPage(
      {required this.surah,
      required this.verses,
      required this.surahNumber,
      super.key});
  final Surah surah;
  final List<Ayah> verses;
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0E9CD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0E9CD),
        title: Text(
          surah.name,
          style: const TextStyle(
            fontFamily: 'UthmanicHafs',
          ),
        ),
        foregroundColor: kmaincolor4,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                  ))),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            color: Colors.transparent,
            child: SizedBox(
              height: Sizeconfig.screenheight! / 2.5,
              width: Sizeconfig.screenwidth! / 1.15,
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
                    height: Sizeconfig.screenheight! / 2.5,
                    width: Sizeconfig.screenwidth! / 1.15,
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
                        _cardtext(surah.name, 29),
                        _cardtext(surah.revelationType, 20),
                        const Divider(
                          endIndent: 40,
                          indent: 40,
                          thickness: 1.3,
                          color: Colors.white,
                        ),
                        _cardtext('${surah.ayahs.length} ${" verses".tr}', 20),
                        Visibility(
                          visible: surah.number == 9 ? false : true,
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
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 20,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: surah.ayahs.length,
            itemBuilder: (context, index) {
              return Visibility(
                visible: verses[index].numberInSurah == 1 && surah.number != 9
                    ? false
                    : true,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: kmaincolor4.withOpacity(0.1),
                      ),
                      height: 50,
                      width: Sizeconfig.screenwidth! / 1.16,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: kmaincolor4,
                          child: Text(
                            "{${surah.number != 9 ? surah.ayahs[index].numberInSurah - 1 : surah.ayahs[index].numberInSurah}}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        trailing: SizedBox(
                          width: Sizeconfig.screenwidth! / 2.5,
                          child: Row(
                            children: [
                              _iconbuttons(Icons.share_outlined, () {}),
                              _iconbuttons(Icons.play_arrow_outlined, () {}),
                              _iconbuttons(Icons.save_outlined, () {}),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Sizeconfig.screenwidth! / 1.16,
                      child: Text(
                        verses[index].text,
                        style: const TextStyle(
                            fontFamily: 'UthmanicHafs', fontSize: 34),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      )),
    );
  }

  IconButton _iconbuttons(IconData icon, VoidCallback onpressed) => IconButton(
      onPressed: onpressed,
      icon: Icon(
        icon,
        color: kmaincolor4,
        weight: 2,
        size: 25,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.black26.withOpacity(0.1),
          )
        ],
      ));

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
