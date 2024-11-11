import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/times_page_controller.dart';

class PrayertimesController extends GetxController {
  final DeterminePrayersController prayerctrl = Get.find();
  final LocationController locationctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();
  final TimesPageController timespagectrl = Get.find();

  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    isLoading(true);
    await locationctrl.determinePosition();
    await fpfctrl.fetchPrayerTimes();
    prayerctrl.determineCurrentPrayer();
    timespagectrl.pagecontroller();
    isLoading(false);
    super.onInit();
  }
}
