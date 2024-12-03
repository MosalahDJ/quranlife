// ignore_for_file: avoid_print

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

final DeterminePrayersController dpcctrl = Get.find();

DateTime nextsalattime = dpcctrl.parseTime(dpcctrl.nextPrayerTime.value);
String prayername = dpcctrl.currentPrayer.value;

class AdhanNotiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    adhansubscribition.value == true
        ? schedulePrayerNotification()
        : cancelAdhanNotification(id: 1);
  }

  RxBool adhansubscribition = true.obs;

  Future<void> schedulePrayerNotification() async {
    final String timezone = await FlutterTimezone.getLocalTimezone();

    final tz.TZDateTime scheduledTime =
        tz.TZDateTime.from(nextsalattime, tz.getLocation(timezone));

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'prayer_channel',
      'Prayer Notifications',
      channelDescription: 'Notifications for prayer times',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'Prayer Notification',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'وقت صلاة $prayername',
      'حان الآن وقت صلاة $prayername.',
      scheduledTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // جدولة فقط حسب الوقت
    );
    print(prayername);
    print(nextsalattime);
  }

//cancel specific notification
  Future cancelAdhanNotification({
    required int id,
  }) async {
    await flutterLocalNotificationsPlugin.cancel(id);
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
    // }
  }
}
