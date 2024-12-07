import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';

final AdhanNotiController adhanController = Get.find();

class WorkManagerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeWorkManager();
    scheduleAdhanNotification();
  }

  Future<void> initializeWorkManager() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  }

  Future<void> scheduleAdhanNotification() async {
    // Schedule initial notification using AdhanNotiController
    await adhanController.schedulePrayerNotification();

    // Register a periodic task to check and update prayer times
    await Workmanager().registerPeriodicTask(
      'adhan_periodic_task',
      'adhanTask',
      frequency: const Duration(minutes: 15), // Check every 15 minutes
      constraints: Constraints(
        networkType: NetworkType.not_required,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );
  }

  // This is the function that will be called by WorkManager
  static void callbackDispatcher() {
    Workmanager().executeTask((taskName, inputData) async {
      try {
        switch (taskName) {
          case 'adhanTask':
            // Schedule next prayer notification
            await adhanController.schedulePrayerNotification();
            break;
          case 'adhkarTask':
            // Handle Adhkar notification task
            break;
          case 'quranTask':
            // Handle Quran notification task
            break;
          default:
            print('Unknown task: $taskName');
        }
        return Future.value(true);
      } catch (err) {
        print('Error executing task: $err');
        return Future.value(false);
      }
    });
  }

  Future<void> cancelAdhanNotification() async {
    await Workmanager().cancelByUniqueName('adhan_periodic_task');
    await adhanController.cancelAdhanNotification(id: 1);
  }

  // Cancel all tasks
  Future<void> cancelAllTasks() async {
    await Workmanager().cancelAll();
  }
}
