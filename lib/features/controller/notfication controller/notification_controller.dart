import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationController extends GetxController {
  //must be toplevel and static func for recivebackgrounnoti in initialiseNotification func
  //so i call it here
  static ontap(NotificationResponse notificationResponse) {}

  //initialize the plugin
  static Future initialiseNotification() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: ontap,
      onDidReceiveBackgroundNotificationResponse: ontap,
    );
  }

  //cancel All notification
  Future cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
