import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhkar_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/quraan_noti_controller.dart';
import 'package:workmanager/workmanager.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';

// Global instances for WorkManager callback
final adhanController = Get.put(AdhanNotiController());
final adhkarController = Get.put(AdhkarnotiController());
final quraanController = Get.put(QuraanNotiController());
final notificationController = Get.put(NotificationController());

enum NotificationType { adhan, adhkar, quraan }

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      switch (task) {
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
      return true;
    } catch (err) {
      // ignore: avoid_print
      print('Error executing task: $err');
      return false;
    }
  });
}

class WorkManagerController extends GetxController {
  RxBool adhansubscribition = false.obs;
  RxBool adhkarsubscribition = false.obs;
  RxBool quraansubscribition = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeWorkManager();
  }

  Future<void> initializeWorkManager() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
    // Register tasks based on saved preferences
    if (adhansubscribition.value) await registerPeriodicTask(NotificationType.adhan);
    if (adhkarsubscribition.value) await registerPeriodicTask(NotificationType.adhkar);
    if (quraansubscribition.value) await registerPeriodicTask(NotificationType.quraan);
  }

  // Register periodic task with common configuration
  Future<void> registerPeriodicTask(NotificationType type) async {
    final taskConfig = _getTaskConfig(type);
    
    switch (type) {
      case NotificationType.quraan:
        // Schedule Quran notification once per day at 8:00 AM
        await Workmanager().registerPeriodicTask(
          taskConfig.uniqueName,
          taskConfig.taskName,
          frequency: const Duration(days: 1),
          initialDelay: _getInitialDelay(),
          constraints: Constraints(
            networkType: NetworkType.not_required,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresDeviceIdle: false,
            requiresStorageNotLow: false,
          ),
          existingWorkPolicy: ExistingWorkPolicy.replace,
        );
        break;
        
      case NotificationType.adhkar:
        // Schedule Adhkar notifications every 15 minutes
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
          existingWorkPolicy: ExistingWorkPolicy.replace,
        );
        break;
        
      case NotificationType.adhan:
        // Schedule Adhan notifications based on prayer times
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
          existingWorkPolicy: ExistingWorkPolicy.replace,
        );
        break;
    }
  }

  // Calculate initial delay to 8:00 AM for Quran notifications
  Duration _getInitialDelay() {
    final now = DateTime.now();
    final eightAM = DateTime(now.year, now.month, now.day, 8, 0);
    
    if (now.isAfter(eightAM)) {
      // If it's after 8 AM, schedule for next day
      final tomorrow = eightAM.add(const Duration(days: 1));
      return tomorrow.difference(now);
    } else {
      // If it's before 8 AM, schedule for today
      return eightAM.difference(now);
    }
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
  void onChangeSubscription(NotificationType type, bool value) async {
    switch (type) {
      case NotificationType.adhan:
        adhansubscribition.value = value;
        break;
      case NotificationType.adhkar:
        adhkarsubscribition.value = value;
        break;
      case NotificationType.quraan:
        quraansubscribition.value = value;
        break;
    }
    
    if (value) {
      await registerPeriodicTask(type);
    } else {
      await cancelNotification(type);
    }
    update();
  }
}

class TaskConfig {
  final String uniqueName;
  final String taskName;
  const TaskConfig(this.uniqueName, this.taskName);
}
