import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/model/qurandata.dart';

class SurahPage extends StatefulWidget {
  final String surahName;
  final List<Ayah> verses;
  final int surahNumber;

  const SurahPage({
    super.key,
    required this.surahName,
    required this.verses,
    required this.surahNumber,
  });

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1f4037), Color(0xFF99f2c8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Column(
            children: [
              Text(
                widget.surahName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Uthmanic',
                ),
              ),
              Text(
                'آياتها ${widget.verses.length}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.translate),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: kmaincolor3,
        ),
        child: Column(
          children: [
            if (widget.surahNumber != 9) // التوبة doesn't start with bismillah
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Uthmanic',
                    color: Color(0xFF1f4037),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.verses.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF1f4037), width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color(0xFF1f4037),
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon:
                                          const Icon(Icons.play_circle_outline),
                                      onPressed: () {
                                        // TODO: Implement audio playback
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.verses[index].text,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    height: 2,
                                    fontFamily: 'Uthmanic',
                                    color: Color(0xFF1f4037),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
