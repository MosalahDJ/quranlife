import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';

class AdhanNotiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    adhansubscribition.value == true
        ? showPeriodicAdhanNotification(
            id: 1,
            title: "periodic adhan",
            body: "periodic adhan body",
            pyload: "periodic adhan data",
            repeatinterval: RepeatInterval.everyMinute)
        : cancelAdhanNotification(id: 1);
  }

  RxBool adhansubscribition = true.obs;

  //show periodic notification
  Future showPeriodicAdhanNotification({
    required String title,
    required String body,
    required String pyload,
    required RepeatInterval repeatinterval,
    required int id,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Adhan',
      'Adhan channel',
      channelDescription: 'this chanel is for prayer notification',
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
  Future cancelAdhanNotification({
    required int id,
  }) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  //i use this func for changing adhan subscribtion status
  onchangesubscribtion(bool value) {
    value == false
        ? cancelAdhanNotification(id: 1)
        : showPeriodicAdhanNotification(
            id: 1,
            title: "periodic adhan",
            body: "periodic adhan body",
            pyload: "periodic adhan data",
            repeatinterval: RepeatInterval.everyMinute);
    update();
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
