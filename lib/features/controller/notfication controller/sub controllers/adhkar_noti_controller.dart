import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';

class Adhkarnoticontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    adhkarsubscribition.value == true
        ? showPeriodicAdhkarNotification(
            id: 1,
            title: "periodic adhan",
            body: "periodic adhan body",
            pyload: "periodic adhan data",
            repeatinterval: RepeatInterval.everyMinute)
        : cancelAdhkarNotification(id: 1);
  }

  RxBool adhkarsubscribition = false.obs;

  //show periodic notification
  Future showPeriodicAdhkarNotification({
    required String title,
    required String body,
    required String pyload,
    required RepeatInterval repeatinterval,
    required int id,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Adhkar',
      'Adhkar channel',
      channelDescription: 'this chanel is for Adhkar notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, repeatinterval, notificationDetails,
        payload: pyload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  //cancel specific notification
  Future cancelAdhkarNotification({
    required int id,
  }) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  //i use this func for changing adhan subscribtion status
  onchangesubscribtion(bool value) {
    value == false
        ? cancelAdhkarNotification(id: 1)
        : showPeriodicAdhkarNotification(
            id: 1,
            title: "periodic adkar",
            body: "periodic adhkar body",
            pyload: "periodic adhkar data",
            repeatinterval: RepeatInterval.everyMinute);
    update();
  }
}
