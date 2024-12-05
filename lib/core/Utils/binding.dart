import 'package:get/get.dart';
import 'package:quranlife/features/controller/Auth%20controller/googlelogincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/favorite%20controller/favoritecontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhkar_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/quraan_noti_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/controller/fcm%20controllers/my_acces_token.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/prayer_times_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/times_page_controller.dart';
import 'package:quranlife/features/controller/spalshview%20controller/animationcontroller.dart';
import 'package:quranlife/features/controller/notfication%20controller/work_manager_controller.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() {
    //splashview injection
    Get.put<Animationcontrollers>(Animationcontrollers());
    //auth ijection
    Get.put<SignInController>(SignInController());
    Get.put<LogInController>(LogInController());
    Get.put<GoogleLogInController>(GoogleLogInController());
    Get.put<GoogleSignoutController>(GoogleSignoutController());
    Get.put<Txtvalcontroller>(Txtvalcontroller());
    Get.put<PasswordresetController>(PasswordresetController());
    //prayertimes injection
    Get.put<LocationController>(LocationController(), permanent: true);
    Get.put<FetchPrayerFromDate>(FetchPrayerFromDate(), permanent: true);
    Get.put<DeterminePrayersController>(DeterminePrayersController(),
        permanent: true);
    Get.put<TimesPageController>(TimesPageController(), permanent: true);
    Get.put<PrayertimesController>(PrayertimesController(), permanent: true);
    //fcm injection
    Get.put<AccesToken>(AccesToken());
    Get.put<FCMController>(FCMController(), permanent: true);
    //notification injection
    Get.put<NotificationController>(NotificationController(), permanent: true);
    Get.put<AdhanNotiController>(AdhanNotiController(), permanent: true);
    Get.put<QuraanNotiController>(QuraanNotiController(), permanent: true);
    Get.put<AdhkarnotiController>(AdhkarnotiController(), permanent: true);
    Get.put<WorkManagerController>(WorkManagerController(), permanent: true);
    //theme injection
    Get.put<ThemeController>(ThemeController(), permanent: true);
    //home injection
    Get.put<MyHomeController>(MyHomeController());
    //favorite injection
    Get.put<FavoriteController>(FavoriteController(), permanent: true);
  }
}
