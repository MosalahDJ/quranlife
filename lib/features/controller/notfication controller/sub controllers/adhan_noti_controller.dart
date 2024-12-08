// ignore_for_file: avoid_print

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/shared_preferences_keys.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final DeterminePrayersController dpcctrl = Get.find();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AdhanNotiController extends GetxController {
  late DateTime nextsalattime;

  // Volume control variables
  RxBool fajrvolum = false.obs;
  RxBool sunrizevolum = false.obs;
  RxBool duhrvolum = false.obs;
  RxBool asrvolum = false.obs;
  RxBool maghribvolum = false.obs;
  RxBool ishavolum = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadVolumeStates();
  }

  // Load volume states from SharedPreferences
  Future<void> loadVolumeStates() async {
    final prefs = await SharedPreferences.getInstance();
    fajrvolum.value = prefs.getBool(SharedPreferencesKeys.FAJR_VOLUME_KEY) ?? false;
    sunrizevolum.value = prefs.getBool(SharedPreferencesKeys.SUNRISE_VOLUME_KEY) ?? false;
    duhrvolum.value = prefs.getBool(SharedPreferencesKeys.DHUHR_VOLUME_KEY) ?? false;
    asrvolum.value = prefs.getBool(SharedPreferencesKeys.ASR_VOLUME_KEY) ?? false;
    maghribvolum.value = prefs.getBool(SharedPreferencesKeys.MAGHRIB_VOLUME_KEY) ?? false;
    ishavolum.value = prefs.getBool(SharedPreferencesKeys.ISHA_VOLUME_KEY) ?? false;
  }

  Future<void> schedulePrayerNotification() async {
    // await nexSalatTimeChecking();
    String prayername = dpcctrl.nextPrayer.value;

    final String timezone = await FlutterTimezone.getLocalTimezone();

    final tz.TZDateTime scheduledTime =
        tz.TZDateTime.from(nextsalattime, tz.getLocation(timezone));

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'prayer_channel',
      'Prayer Notifications',
      tag: "adhan_tag",
      channelDescription: 'Notifications for prayer times',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'Prayer Notification',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      "adhan $prayername",
      "it's time for adhan $prayername.",
      scheduledTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    print(prayername);
    print(nextsalattime);
  }

  //cancel specific notification
  Future cancelAdhanNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1, tag: "adhan_tag");
  }

  // Volume control functions with SharedPreferences
  Future<void> volumfunc(RxBool volum) async {
    final prefs = await SharedPreferences.getInstance();
    volum.value = !volum.value;
    
    // Save the new state
    if (volum == fajrvolum) {
      await prefs.setBool(SharedPreferencesKeys.FAJR_VOLUME_KEY, volum.value);
    } else if (volum == sunrizevolum) {
      await prefs.setBool(SharedPreferencesKeys.SUNRISE_VOLUME_KEY, volum.value);
    } else if (volum == duhrvolum) {
      await prefs.setBool(SharedPreferencesKeys.DHUHR_VOLUME_KEY, volum.value);
    } else if (volum == asrvolum) {
      await prefs.setBool(SharedPreferencesKeys.ASR_VOLUME_KEY, volum.value);
    } else if (volum == maghribvolum) {
      await prefs.setBool(SharedPreferencesKeys.MAGHRIB_VOLUME_KEY, volum.value);
    } else if (volum == ishavolum) {
      await prefs.setBool(SharedPreferencesKeys.ISHA_VOLUME_KEY, volum.value);
    }
    
    update();
  }
}
