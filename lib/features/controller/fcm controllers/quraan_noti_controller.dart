import 'dart:async';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';

final FCMController notictrl = Get.find();

class QuraanNotiController extends GetxController {
  @override
  void onInit() {
    quraansubscribition.value == true
        ? notictrl.subscribetotopic("Quraan")
        : notictrl.unsbscribefrometopic("Quraan");
    super.onInit();
  }

  RxBool quraansubscribition = true.obs;

  Timer? _timer;

  //this func is for sending adhkar notification i use it in init of PT controller
  sendAdhkarNoti() {
    _timer = Timer.periodic(const Duration(minutes: 15), (timer) {
      notictrl.sendmessage("Adhkar", "عنوان ل الدكر", "الدكر", "adhkar");
    });
  }

  //this func is for sending adhkar notification i use it in init of PT controller
  morningAndEveningDikr() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      String now =
          "${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}:${DateTime.now().second.toString().padLeft(2, "0")}";
      if (now == "08:00:00") {
        notictrl.sendmessage(
            "M&Edikr", "Morning Dikr", "it's time for morning dikr", "Morning");
      } else if (now == "16:00:00") {
        notictrl.sendmessage(
            "M&Edikr", "Evening Dikr", "it's time for Evening dikr", "evening");
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
