import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';

class QuraanNotiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    quraansubscribition.value == true
        ? showPeriodicQuraanNotification(
            id: 1,
            title: "periodic quraan",
            body: "periodic quraan body",
            pyload: "periodic quraan data",
            repeatinterval: RepeatInterval.everyMinute)
        : cancelQuraanNotification(id: 1);
  }

  RxBool quraansubscribition = false.obs;

  //show periodic notification
  Future showPeriodicQuraanNotification({
    required String title,
    required String body,
    required String pyload,
    required RepeatInterval repeatinterval,
    required int id,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'quraan',
      'quraan chanel',
      channelDescription: 'this chanel is for quraan notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, repeatinterval, notificationDetails,
        payload: pyload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
    Future.delayed(
      const Duration(minutes: 1),
      () {
        print("1 munute passed");
      },
    );
  }

  //cancel specific notification
  Future cancelQuraanNotification({
    required int id,
  }) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  //i use this func for changing adhan subscribtion status
  onchangesubscribtion(bool value) {
    value == false
        ? cancelQuraanNotification(id: 1)
        : showPeriodicQuraanNotification(
            id: 1,
            title: "periodic quran",
            body: "periodic quran body",
            pyload: "periodic quran data",
            repeatinterval: RepeatInterval.everyMinute);
    update();
  }
}
