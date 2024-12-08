// ignore_for_file: avoid_print

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

final DeterminePrayersController dpcctrl = Get.find();

class AdhanNotiController extends GetxController {
  late DateTime nextsalattime;

  Future<void> schedulePrayerNotification() async {
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
  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1, tag: "adhan_tag");
  }

  // Volume control functions
  RxBool fajrvolum = false.obs;
  RxBool sunrizevolum = false.obs;
  RxBool duhrvolum = false.obs;
  RxBool asrvolum = false.obs;
  RxBool maghribvolum = false.obs;
  RxBool ishavolum = false.obs;

  volumfunc(RxBool volum) {
    volum.value = !volum.value;
    update();
  }
}
