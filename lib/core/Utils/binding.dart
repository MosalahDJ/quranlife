import 'package:get/get.dart';
import 'package:project/features/controller/Auth%20controller/anonymous_sign_in.dart';
import 'package:project/features/controller/Auth%20controller/logincontroller.dart';
import 'package:project/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';
import 'package:project/features/controller/adkar%20controller/adkar_categories_controller.dart';
import 'package:project/features/controller/adkar%20controller/adkar_controller.dart';
import 'package:project/features/controller/ahadith%20controller/ahadith_controller.dart';
import 'package:project/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:project/features/controller/fcm%20controllers/my_acces_token.dart';
import 'package:project/features/controller/fetching%20data%20controller/allah_names_controller.dart';
import 'package:project/features/controller/fetching%20data%20controller/ghusl_controller.dart';
import 'package:project/features/controller/fetching%20data%20controller/haj_controller.dart';
import 'package:project/features/controller/fetching%20data%20controller/islamic_ruqya_controller.dart';
import 'package:project/features/controller/fetching%20data%20controller/omra_controller.dart';
import 'package:project/features/controller/fetching%20data%20controller/wudu_controller.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';
import 'package:project/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:project/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:project/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:project/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:project/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:project/features/controller/quraan%20controller/saving_controller.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';
import 'package:project/features/controller/spalshview%20controller/splash_view_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() async {
    //splashview injection
    Get.put<LocationController>(LocationController(), permanent: true);
    Get.put<GetResponseBody>(GetResponseBody());
    Get.put<FetchPrayerFromDate>(FetchPrayerFromDate(), permanent: true);
    Get.put<DeterminePrayersController>(
      DeterminePrayersController(),
      permanent: true,
    );
    Get.put<TimesPageController>(TimesPageController(), permanent: true);
    Get.put<AnonymouslysignIn>(AnonymouslysignIn());
    Get.put<SplashViewController>(SplashViewController());
    // LanguageController
    final prefs = await SharedPreferences.getInstance();
    Get.put(LanguageController(prefs), permanent: true);
    //auth injection
    Get.put<LogInController>(LogInController());
    //fcm injection
    Get.put<AccesToken>(AccesToken());
    Get.put<FCMController>(FCMController(), permanent: true);
    //notification injection
    //theme injection
    Get.put<ThemeController>(ThemeController(), permanent: true);
    //home injection
    Get.put<MyHomeController>(MyHomeController());
    //quraan injection
    Get.put<QuraanController>(QuraanController());
    Get.put<SavingController>(SavingController());
    //adkar injection
    Get.put<AdkarCategoriesController>(AdkarCategoriesController());
    Get.put<AdkarController>(AdkarController());
    //categories pages injection
    Get.put<AllahNamesController>(AllahNamesController());
    Get.put<WuduController>(WuduController());
    Get.put<GhuslController>(GhuslController());
    Get.put<AhadithController>(AhadithController());
    Get.put<IslamicruqyaController>(IslamicruqyaController());
    Get.put<OmraController>(OmraController());
    Get.put<HajController>(HajController());
    //complain injection
    Get.put<UrlLuncherAndSharingController>(
      UrlLuncherAndSharingController(),
      permanent: true,
    );
  }
}
