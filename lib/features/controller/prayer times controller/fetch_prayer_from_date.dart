// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:get/get.dart';
import 'package:project/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Map<String, dynamic> prayerData = {};

class FetchPrayerFromDate extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadPrayerData();
    // Listen to data changes
    ever(dataUpdateTrigger, (_) => loadPrayerData());
  }

  final dataUpdateTrigger = 0.obs;

  Future<void> loadPrayerData() async {
    try {
      prefs = await SharedPreferences.getInstance();
      if (prefs.getString("responsebody") != null) {
        Map<String, dynamic> newData = jsonDecode(
          prefs.getString("responsebody")!,
        );

        // Check if we have data for current date
        String currentDateStr = _formatDate(DateTime.now());
        if (!newData.containsKey(currentDateStr)) {
          // If we don't have data for current date, trigger refresh
          await responsectrl.initileresponse();
          return;
        }

        prayerData = newData;
        await fetchPrayerTimes();
        update(); // Notify UI of changes
      }
    } catch (e) {
      print('Error loading prayer data: $e');
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  final GetResponseBody responsectrl = Get.find();

  RxMap prayersdays = <String, Map<String, String>>{}.obs;
  DateTime currentDate = DateTime.now();
  List prayersdayskeys = [];

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
      prayersdayskeys = prayerData.keys.toList();
      for (int i = 0; i < prayersdayskeys.length; i++) {
        // storing prayertimes in this map
        var timings = prayerData[prayersdayskeys[i]]['data']['timings'];
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
