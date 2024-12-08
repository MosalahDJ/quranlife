import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';

class AdhkarnotiController extends GetxController {
  //show periodic notification
  Future showAdhkarNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'adhkar_channel',
      'Adhkar Notifications',
      tag: "adhkar_tag",
      channelDescription: 'Notifications for adhkar',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(1, "adhkar notification",
        "it's time for reading adhkar", notificationDetails);
  }

  //cancel specific notification
  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1, tag: "adhkar_tag");
  }
}
