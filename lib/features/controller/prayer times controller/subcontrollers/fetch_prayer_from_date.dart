// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/location_controller.dart';

class FetchPrayerFromDate extends GetxController {
  final LocationController locationctrl = Get.find();

  //we add this Map to store iside it prayer times from date whene get it from the api
  RxMap prayersdays = <String, Map<String, String>>{}.obs;
  DateTime currentDate = DateTime.now();
  List prayersdayskeys = [];

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

  //this func is for getting prayer times from the api using http package
  Future<void> fetchPrayerTimes() async {
    try {
      DateTime endDate = currentDate.add(const Duration(days: 30));

      while (currentDate.isBefore(endDate)) {
        //we add this var for passing it as date in url
        var formattedDate = formatDate(currentDate);

        var response = await http.get(Uri.parse(
            "https://api.aladhan.com/v1/timings/$formattedDate?latitude=${locationctrl.latitude}&longitude=${locationctrl.longtude}&method=19"));

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          var timings = jsonResponse['data']['timings'];

          // store data in a Map
          Map<String, String> dailyPrayers = {
            'Fajr': timings['Fajr'],
            'Sunrise': timings['Sunrise'],
            'Dhuhr': timings['Dhuhr'],
            'Asr': timings['Asr'],
            'Maghrib': timings['Maghrib'],
            'Isha': timings['Isha'],
          };

          //add daily prayers to prayersdays with formattedDate as key
          prayersdays[formattedDate] = dailyPrayers;
        } else {
          print('There was an error getting data: ${response.statusCode}');
        }

        // shift to the next day
        currentDate = currentDate.add(const Duration(days: 1));
      }

      prayersdayskeys.addAll(prayersdays.keys.toList());
    } catch (e) {
      print('There was an error: $e');
    }
  }
}
