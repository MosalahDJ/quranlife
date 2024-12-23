// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:quranlife/features/model/data.dart';

class FetchPrayerFromDate extends GetxController {
  final GetResponseBody responsectrl = Get.find();
  final MyData datactrl = Get.find();

  RxMap prayersdays = <String, Map<String, String>>{}.obs;
  DateTime currentDate = DateTime.now();
  List prayersdayskeys = [];

  @override
  void onInit() async {
    super.onInit();
    await fetchPrayerTimes();
  }

  //this func maded for making date string as same as date in the url and make sure it's dynamic
  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  //this func maded for making date string as same as date returned by
  //formatDate func for cheking if it = to date and and show the left time in
  //the table of prayertimes just in the current date
  String formatDateString(String date) {
    List parts = date.split("-");
    return "${parts[0]}-${parts[1].toString().padLeft(2, '0')}-${parts[2].toString().padLeft(2, '0')}";
  }

  // func for getting akey from list of keys
  String? getDateByIndex(int index) {
    final dates = prayersdayskeys;
    if (index >= 0 && index < dates.length) {
      return dates[index];
    }
    return null;
  }

  Future<void> fetchPrayerTimes() async {
    try {
      prayersdayskeys = datactrl.prayerData.keys.toList();
      for (int i = 0; i < prayersdayskeys.length; i++) {
        // storing prayertimes in this map
        var timings =
            datactrl.prayerData[prayersdayskeys[i]]['data']['timings'];
        Map<String, String> dailyPrayers = {
          'Fajr': timings['Fajr'],
          'Sunrise': timings['Sunrise'],
          'Dhuhr': timings['Dhuhr'],
          'Asr': timings['Asr'],
          'Maghrib': timings['Maghrib'],
          'Isha': timings['Isha'],
        };
        //Add every value to his key on prayersdays map
        prayersdays[prayersdayskeys[i]] = dailyPrayers;
      }
    } catch (e) {
      print('there was an error: $e');
    }
  }
}
