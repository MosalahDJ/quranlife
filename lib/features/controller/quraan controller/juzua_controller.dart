import 'package:get/get.dart';

class JuzuaController extends GetxController {
  // Juz start mapping - Maps Juz number to [SurahNumber, AyahNumber]
  final Map<int, List<int>> juzData = {
    1: [1, 1], // Al-Fatiha
    2: [2, 142], // Al-Baqarah
    3: [2, 253], // Al-Baqarah
    4: [3, 93], // Aal-Imran
    5: [4, 24], // An-Nisa
    6: [4, 148], // An-Nisa
    7: [5, 82], // Al-Ma'idah
    8: [6, 111], // Al-An'am
    9: [7, 88], // Al-A'raf
    10: [8, 41], // Al-Anfal
    11: [9, 93], // At-Tawbah
    12: [11, 6], // Hud
    13: [12, 53], // Yusuf
    14: [15, 1], // Al-Hijr
    15: [17, 1], // Al-Isra
    16: [18, 75], // Al-Kahf
    17: [21, 1], // Al-Anbya
    18: [23, 1], // Al-Mu'minun
    19: [25, 21], // Al-Furqan
    20: [27, 56], // An-Naml
    21: [29, 46], // Al-Ankabut
    22: [33, 31], // Al-Ahzab
    23: [36, 28], // Ya-Sin
    24: [39, 32], // Az-Zumar
    25: [41, 47], // Fussilat
    26: [46, 1], // Al-Ahqaf
    27: [51, 31], // Adh-Dhariyat
    28: [58, 1], // Al-Mujadila
    29: [67, 1], // Al-Mulk
    30: [78, 1], // An-Naba
  };
}
