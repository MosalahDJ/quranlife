import 'package:get/get.dart';
import 'package:quranlife/features/controller/Auth%20controller/googlelogincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/Complaine%20Controller/complain_controller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhkar_noti_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/quraan_noti_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/controller/fcm%20controllers/my_acces_token.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/spalshview%20controller/splash_view_controller.dart';
import 'package:quranlife/features/controller/notfication%20controller/work_manager_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() async {
    //splashview injection
    Get.put<LocationController>(LocationController(), permanent: true);
    Get.put<GetResponseBody>(GetResponseBody());
    Get.put<FetchPrayerFromDate>(FetchPrayerFromDate(), permanent: true);
    Get.put<DeterminePrayersController>(DeterminePrayersController(),
        permanent: true);
    Get.put<TimesPageController>(TimesPageController(), permanent: true);
    Get.put<SplashViewController>(SplashViewController());
    // LanguageController
    final prefs = await SharedPreferences.getInstance();
    Get.put(LanguageController(prefs), permanent: true);
    //auth injection
    Get.put<Txtvalcontroller>(Txtvalcontroller());
    Get.put<SignInController>(SignInController());
    Get.put<LogInController>(LogInController());
    Get.put<GoogleLogInController>(GoogleLogInController());
    Get.put<GoogleSignoutController>(GoogleSignoutController());
    Get.put<PasswordresetController>(PasswordresetController());
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
    //complain injection
    Get.put<ComplainController>(ComplainController(), permanent: true);
  }
}
