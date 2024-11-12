// ignore_for_file: avoid_print

import 'dart:async';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';

class DeterminePrayersController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  final FetchPrayerFromDate fpfctrl = Get.find();

  Timer? _timer;
  RxString currentdate = "".obs;
  RxString currentPrayer = "".obs;
  RxString nextPrayer = "".obs;
  RxString nextPrayerTime = "".obs;
  RxString timeUntilNext = "".obs;
  RxBool isnextprayer = false.obs;

  //timer func for refreshing date and prayertime periodicly after each second
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentdate.value =
          "${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year}";
      determineCurrentPrayer();
    });
  }

  //we use this func for changing data type of time frome string to Datetime
  //because we cauth it as String from the api
  DateTime parseTime(String time) {
    var now = DateTime.now();
    var parts = time.split(':');
    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  //making time format for time untile
  String formatTimeUntil(DateTime target) {
    var now = DateTime.now();
    var difference = target.difference(now);
    var hours = difference.inHours;
    var minutes = difference.inMinutes % 60;
    var seconds = difference.inSeconds % 60;
    //we use padleft to esure that  always have two nums
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  //making time format for next time
  String formatTime(DateTime target) {
    var hours = target.hour.toString().padLeft(2, '0');
    var minute = target.minute.toString().padLeft(2, '0');
    return "${hours.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  //determining current prayer time
  void determineCurrentPrayer() {
    try {
      var now = DateTime.now();
      //we use this list for store iside it list's of prayer name and prayer time
      //and we use parse time for ensure it DateTime is not String
      var prayers = [
        [
          'Fajr',
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Fajr']!)
        ],
        [
          'Sunrise',
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Sunrise']!)
        ],
        [
          'Dhuhr',
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Dhuhr']!)
        ],
        [
          'Asr',
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Asr']!)
        ],
        [
          'Maghrib',
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Maghrib']!)
        ],
        [
          'Isha',
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Isha']!)
        ],
      ];

      // Add next day's Fajr to prayers list
      var nextDayFajr = parseTime(fpfctrl
              .prayersdays[fpfctrl.formatDate(now.add(const Duration(days: 1)))]
          ['Fajr']!);
      prayers.add(['Fajr', nextDayFajr]);

      //loop of prayers list for checking current and next prayer and time intile next
      //we use "as datetime" and "as string" here beacause these data is requerd to be dynamic
      //in prayer's list and it requred to be String or Date time here
      for (int i = 0; i < prayers.length - 1; i++) {
        if (now.isAfter(prayers[i][1] as DateTime) &&
            now.isBefore(prayers[i + 1][1] as DateTime)) {
          currentPrayer.value = prayers[i][0] as String;
          nextPrayer.value = prayers[i + 1][0] as String;
          nextPrayerTime.value = formatTime(prayers[i + 1][1] as DateTime);
          timeUntilNext.value = formatTimeUntil(prayers[i + 1][1] as DateTime);
          return;
        }
      }

      // If we're after Isha and before next Fajr
      if (now.isAfter(
          parseTime(fpfctrl.prayersdays[fpfctrl.formatDate(now)]['Isha']!))) {
        currentPrayer.value = 'Isha';
        nextPrayer.value = 'Fajr';
        nextPrayerTime.value = "$nextDayFajr";
        timeUntilNext.value = formatTimeUntil(nextDayFajr);
      }
    } catch (e) {
      // if there any err we use "-" as value
      print('Error determining prayer times: $e');
      currentPrayer.value = "-";
      nextPrayer.value = "-";
      nextPrayerTime.value = "-";
      timeUntilNext.value = "-";
    } finally {}
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
