import 'dart:async';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';

final FCMController notictrl = Get.find();
final DeterminePrayersController prayerctrl = Get.find();
String salattime = "${prayerctrl.nextPrayerTime}:00";
String salat = "${prayerctrl.currentPrayer}";

class AdhanNotiController extends GetxController {
  @override
  void onInit() {
    adhansubscribition.value == true
        ? notictrl.subscribetotopic("Adhan")
        : notictrl.unsbscribefrometopic("Adhan");
    super.onInit();
  }

  RxBool adhansubscribition = true.obs;

  Timer? _timer;
  //this func is for checking every second if now == nextsalattime, if it true send notification
  //i use it in init of PT controller
  sendAdhanNoti() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      String now =
          "${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}:${DateTime.now().second.toString().padLeft(2, "0")}";
      if (now == salattime) {
        notictrl.sendmessage(
            "Adhan", salat, "Its time for Salat $salat", "adhan");
      }
    });
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

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
