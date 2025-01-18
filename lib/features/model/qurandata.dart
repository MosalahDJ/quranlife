class Surah {
  final int number;
  final String name;
  final String name2;
  final String revelationType;
  final List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.name2,
    required this.revelationType,
    required this.ayahs,
  });

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      number: map['number'],
      name: map['name'],
      name2: map['name2'],
      revelationType: map['revelationType'],
      ayahs: List<Ayah>.from(map['ayahs'].map((x) => Ayah.fromMap(x))),
    );
  }
}

class Ayah {
  final int number;
  final String audio;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;

  Ayah({
    required this.number,
    required this.audio,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Ayah.fromMap(Map<String, dynamic> map) {
    return Ayah(
      number: map['number'],
      audio: map['audio'],
      text: map['text'],
      numberInSurah: map['numberInSurah'],
      juz: map['juz'],
      manzil: map['manzil'],
      page: map['page'],
      ruku: map['ruku'],
      hizbQuarter: map['hizbQuarter'],
      sajda: map['sajda'],
    );
  }
}
