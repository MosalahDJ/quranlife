import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhkar_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/quraan_noti_controller.dart';
import 'package:workmanager/workmanager.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';

final AdhanNotiController adhanController = Get.find();
final AdhkarnotiController adhkarController = Get.find();
final QuraanNotiController quraanController = Get.find();
final NotificationController notificationController = Get.find();

enum NotificationType { adhan, adhkar, quraan }

class WorkManagerController extends GetxController {
  RxBool adhansubscribition = false.obs;
  RxBool adhkarsubscribition = false.obs;
  RxBool quraansubscribition = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeWorkManager();
    registerPeriodicTask(NotificationType.adhan);
    registerPeriodicTask(NotificationType.adhkar);
    registerPeriodicTask(NotificationType.quraan);
  }

  Future<void> initializeWorkManager() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  }

  // Register periodic task with common configuration
  Future<void> registerPeriodicTask(NotificationType type) async {
    final taskConfig = _getTaskConfig(type);
    await Workmanager().registerPeriodicTask(
      taskConfig.uniqueName,
      taskConfig.taskName,
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.not_required,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );
  }

  // This function will be called by WorkManager in initialization
  static void callbackDispatcher() {
    Workmanager().executeTask((taskName, inputData) async {
      try {
        switch (taskName) {
          case 'adhanTask':
            await adhanController.schedulePrayerNotification();
            break;
          case 'adhkarTask':
            await adhkarController.showAdhkarNotification();
            break;
          case 'quranTask':
            await quraanController.showQuraanNotification();
            break;
        }
        return Future.value(true);
      } catch (err) {
        // ignore: avoid_print
        print('Error executing task: $err');
        return Future.value(false);
      }
    });
  }

  // Cancel notification for specific type
  Future<void> cancelNotification(NotificationType type) async {
    final taskConfig = _getTaskConfig(type);
    final controller = _getController(type);
    await Workmanager().cancelByUniqueName(taskConfig.uniqueName);
    await controller.cancelNotification();
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await Workmanager().cancelAll();
    await notificationController.cancelAllNotification();
  }

  // Helper function to get task configuration
  TaskConfig _getTaskConfig(NotificationType type) {
    switch (type) {
      case NotificationType.adhan:
        return const TaskConfig('adhan_periodic_task', 'adhanTask');
      case NotificationType.adhkar:
        return const TaskConfig('adhkar_periodic_task', 'adhkarTask');
      case NotificationType.quraan:
        return const TaskConfig('quraan_periodic_task', 'quranTask');
    }
  }

  // Helper function to get controller
  dynamic _getController(NotificationType type) {
    switch (type) {
      case NotificationType.adhan:
        return adhanController;
      case NotificationType.adhkar:
        return adhkarController;
      case NotificationType.quraan:
        return quraanController;
    }
  }

  // Unified subscription change handler
  void onChangeSubscription(NotificationType type, bool value) {
    value ? registerPeriodicTask(type) : cancelNotification(type);
    update();
  }
}

class TaskConfig {
  final String uniqueName;
  final String taskName;
  const TaskConfig(this.uniqueName, this.taskName);
}
