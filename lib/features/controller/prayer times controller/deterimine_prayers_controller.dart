// ignore_for_file: avoid_print

import 'dart:async';
import 'package:get/get.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';

class DeterminePrayersController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  final FetchPrayerFromDate fpfctrl = Get.find();

  Timer? _timer;
  RxString currentdate = "".obs;
  RxString currentPrayer = "".obs;
  RxString currentPrayertime = "".obs;
  RxString nextPrayer = "".obs;
  RxString nextPrayerTime = "".obs;
  RxString timeUntilNext = "".obs;
  RxBool isnextprayer = false.obs;

  //this func maded for making date string as same as date in the url and make sure it's dynamic
  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  //timer func for refreshing date and prayertime periodicly after each second
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentdate.value =
          "${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year}";
      determineCurrentPrayer();
    });
  }

  //we use this func for changing data type of time frome string to Datetime
  //because we cauth it as String from the api
  DateTime _parseTime(String time) {
    try {
      var now = DateTime.now();
      var parts = time.trim().split(':');
      if (parts.length != 2) {
        throw FormatException('Invalid time format: $time');
      }
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0].trim()),
        int.parse(parts[1].trim()),
      );
    } catch (e) {
      print('Error parsing time: $time - Error: $e');
      // Return a default time in case of error
      return DateTime.now();
    }
  }

  //we use this func for changing data type of time frome string to Datetime
  //because we cauth it as String from the api
  //I use this func not above the func because i need in this case tomorow's fajr
  DateTime _parsenextdayfajr(String time) {
    try {
      var tomorow = DateTime.now().add(const Duration(days: 1));
      var parts = time.trim().split(':');
      if (parts.length != 2) {
        throw FormatException('Invalid time format: $time');
      }
      return DateTime(
        tomorow.year,
        tomorow.month,
        tomorow.day,
        int.parse(parts[0].trim()),
        int.parse(parts[1].trim()),
      );
    } catch (e) {
      print('Error parsing next day fajr time: $time - Error: $e');
      // Return a default time in case of error
      return DateTime.now().add(const Duration(days: 1));
    }
  }

  //making time format for time untile
  String _formatTimeUntil(DateTime target) {
    var now = DateTime.now();
    var difference = target.difference(now);
    var hours = difference.inHours;
    var minutes = difference.inMinutes % 60;
    var seconds = difference.inSeconds % 60;
    //we use padleft to esure that  always have two nums
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  //making time format for next time
  String _formatTime(DateTime target) {
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
        ['Fajr', _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Fajr']!)],
        [
          'Sunrise',
          _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Sunrise']!),
        ],
        ['Dhuhr', _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Dhuhr']!)],
        ['Asr', _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Asr']!)],
        [
          'Maghrib',
          _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Maghrib']!),
        ],
        ['Isha', _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Isha']!)],
      ];

      // Add next day's Fajr to prayers list
      var nextDayFajr = _parsenextdayfajr(
        fpfctrl.prayersdays[_formatDate(
          now.add(const Duration(days: 1)),
        )]['Fajr']!,
      );

      //loop of prayers list for checking current and next prayer and time intile next
      //we use "as datetime" and "as string" here beacause these data is requerd to be dynamic
      //in prayer's list and it requred to be String or Date time here
      for (int i = 0; i < prayers.length - 1; i++) {
        if (now.isAfter(prayers[i][1] as DateTime) &&
            now.isBefore(prayers[i + 1][1] as DateTime)) {
          currentPrayer.value = prayers[i][0] as String;
          nextPrayer.value = prayers[i + 1][0] as String;
          nextPrayerTime.value = _formatTime(prayers[i + 1][1] as DateTime);
          timeUntilNext.value = _formatTimeUntil(prayers[i + 1][1] as DateTime);
          currentPrayertime.value = _formatTime(prayers[i][1] as DateTime);
          return;
        }
      }

      // If we're after Isha

      if (now.isAfter(
        _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Isha']!),
      )) {
        currentPrayer.value = 'Isha';
        nextPrayer.value = 'Fajr';
        nextPrayerTime.value = _formatTime(nextDayFajr);
        timeUntilNext.value = _formatTimeUntil(nextDayFajr);
      }

      //if we are before Fajr

      if (now.isBefore(
        _parseTime(fpfctrl.prayersdays[_formatDate(now)]['Fajr']!),
      )) {
        currentPrayer.value = 'Isha';
        nextPrayer.value = 'Fajr';
        nextPrayerTime.value = _formatTime(prayers[0][1] as DateTime);
        timeUntilNext.value = _formatTimeUntil(prayers[0][1] as DateTime);
      }
    } catch (e) {
      // if there any err we use "-" as value
      print('Error determining prayer times: $e');
      currentPrayer.value = "-";
      nextPrayer.value = "-";
      nextPrayerTime.value = "-";
      timeUntilNext.value = "-";
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
