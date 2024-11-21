import 'package:get/get.dart';
import 'package:quranlife/features/controller/Auth%20controller/googlelogincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/favorite%20controller/favoritecontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:quranlife/features/controller/notification%20controller/acces_token.dart';
import 'package:quranlife/features/controller/notification%20controller/notification_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/prayer_times_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/times_page_controller.dart';
import 'package:quranlife/features/controller/spalshview%20controller/animationcontroller.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Animationcontrollers>(Animationcontrollers());
    Get.put<SignInController>(SignInController());
    Get.put<LogInController>(LogInController());
    Get.put<GoogleLogInController>(GoogleLogInController());
    Get.put<GoogleSignoutController>(GoogleSignoutController());
    Get.put<Txtvalcontroller>(Txtvalcontroller());
    Get.put<Passwordresetcontroller>(Passwordresetcontroller());
    Get.put<LocationController>(LocationController(), permanent: true);
    Get.put<FetchPrayerFromDate>(FetchPrayerFromDate(), permanent: true);
    Get.put<DeterminePrayersController>(DeterminePrayersController(),
        permanent: true);
    Get.put<TimesPageController>(TimesPageController(), permanent: true);
    Get.put<AccesToken>(AccesToken());
    Get.put<NotificationController>(NotificationController(), permanent: true);
    Get.put<PrayertimesController>(PrayertimesController(), permanent: true);
    Get.put<MyHomeController>(MyHomeController());
    Get.put<FavoriteController>(FavoriteController(), permanent: true);
  }
}
