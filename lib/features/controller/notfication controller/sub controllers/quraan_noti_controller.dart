import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';

class QuraanNotiController extends GetxController {
  //show periodic notification
  Future showQuraanNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'quraan_channel',
      'Quraan Notifications',
      tag: "quraan_tag",
      channelDescription: 'Notifications for quraan',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(1, "quraan notification",
        "it's time for reading quraan", notificationDetails);
  }

  //cancel specific notification
  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1, tag: "quraan_tag");
  }
}
