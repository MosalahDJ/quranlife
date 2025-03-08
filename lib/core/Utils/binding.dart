import 'package:get/get.dart';
import 'package:quranlife/features/controller/Auth%20controller/anonymous_sign_in.dart';
import 'package:quranlife/features/controller/Auth%20controller/delet_account.dart';
import 'package:quranlife/features/controller/Auth%20controller/googlelogincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';
import 'package:quranlife/features/controller/adkar%20controller/adkar_categories_controller.dart';
import 'package:quranlife/features/controller/adkar%20controller/adkar_controller.dart';
import 'package:quranlife/features/controller/ahadith%20controller/ahadith_controller.dart';
import 'package:quranlife/features/controller/ai%20chat%20controller/ai_chat_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/allah_names_controller.dart';
import 'package:quranlife/features/controller/floating_animation_controllers/floating_animation_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/ghusl_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/haj_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/islamic_ruqya_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/omra_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/praise_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/prophets_supplication_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/quraanic_supplication_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/seeking_forgivnes.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/sunan_jumua_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/teaching_prayer_controller.dart';
import 'package:quranlife/features/controller/fetching%20data%20controller/wudu_controller.dart';
import 'package:quranlife/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:quranlife/features/controller/map%20controller/map_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/get_response_body.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/times_page_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/audioplayer_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/favorite_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/juzua_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';
import 'package:quranlife/features/controller/quraan%20controller/saving_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/controller/fcm%20controllers/my_acces_token.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/deterimine_prayers_controller.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/spalshview%20controller/splash_view_controller.dart';
import 'package:quranlife/features/controller/statistics%20controller/statistics_controller.dart';
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
    Get.put<AnonymouslysignIn>(AnonymouslysignIn());
    Get.put<SplashViewController>(SplashViewController());
    // LanguageController
    final prefs = await SharedPreferences.getInstance();
    Get.put(LanguageController(prefs), permanent: true);
    //auth injection
    Get.put<Txtvalcontroller>(Txtvalcontroller());
    Get.put<SignInController>(SignInController());
    Get.put<LogInController>(LogInController());
    Get.put<GoogleLogInController>(GoogleLogInController());
    Get.put<DeletAccount>(DeletAccount());
    Get.put<PasswordresetController>(PasswordresetController());
    //fcm injection
    Get.put<AccesToken>(AccesToken());
    Get.put<FCMController>(FCMController(), permanent: true);
    //notification injection
    // Get.put<WorkManagerController>(WorkManagerController(), permanent: true);
    //theme injection
    Get.put<ThemeController>(ThemeController(), permanent: true);
    //home injection
    Get.put<MyHomeController>(MyHomeController());
    Get.put<AiChatController>(AiChatController());
    Get.put<FadeAnimationController>(FadeAnimationController());
    Get.put<FloatingAnimationController>(FloatingAnimationController());
    //quraan injection
    Get.put<QuraanController>(QuraanController());
    Get.put<StatisticsController>(StatisticsController());
    Get.put<JuzuaController>(JuzuaController());
    Get.put<SavingController>(SavingController());
    Get.put<FavoriteController>(FavoriteController());
    Get.put<AudioplayerController>(AudioplayerController());
    //adkar injection
    Get.put<AdkarCategoriesController>(AdkarCategoriesController());
    Get.put<AdkarController>(AdkarController());
    //categories pages injection
    Get.put<AllahNamesController>(AllahNamesController());
    Get.put<MapController>(MapController());
    Get.put<TeachingPrayerController>(TeachingPrayerController());
    Get.put<WuduController>(WuduController());
    Get.put<GhuslController>(GhuslController());
    Get.put<SunanJumuaController>(SunanJumuaController());
    Get.put<QuraanicSupplicationController>(QuraanicSupplicationController());
    Get.put<QuraanicSupplicationController>(QuraanicSupplicationController());
    Get.put<SeekingForgivnesController>(SeekingForgivnesController());
    Get.put<ProphetsSupplicationController>(ProphetsSupplicationController());
    Get.put<PraiseController>(PraiseController());
    Get.put<AhadithController>(AhadithController());
    Get.put<IslamicruqyaController>(IslamicruqyaController());
    Get.put<OmraController>(OmraController());
    Get.put<HajController>(HajController());
    //complain injection
    Get.put<UrlLuncherAndSharingController>(UrlLuncherAndSharingController(),
        permanent: true);
  }
}
