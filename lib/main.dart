import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quranlife/core/Utils/binding.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/controller/onboarding%20page%20controller/onboarding_pagecontroller.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';
import 'package:quranlife/features/view/auth/login%20page/loginpage.dart';
import 'package:quranlife/features/view/auth/signin%20page/signin_page.dart';
import 'package:quranlife/features/view/home/adkar%20page/adkar_page.dart';
import 'package:quranlife/features/view/home/hijri%20calender/hijri_calender.dart';
import 'package:quranlife/features/view/home/home_page.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/settings%20page/setting_page.dart';
import 'package:quranlife/features/view/home/mytestpage.dart';
import 'package:quranlife/features/view/home/quraan%20page/quraan_page.dart';
import 'package:quranlife/features/view/home/salat%20time/prayer_time_page.dart';
import 'package:quranlife/features/view/onboarding%20pages/on_boarding_view.dart';
import 'package:quranlife/features/view/splash%20page/splash_view.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initialiseNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(const QuranLifeApp());
}

class QuranLifeApp extends StatelessWidget {
  const QuranLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<ThemeController>(ThemeController(), permanent: true);

    return GetMaterialApp(
      theme: ThemeController().currentTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: Mybinding(),
      home: const SplashView(),
      getPages: getpages,
    );
  }

  List<GetPage<dynamic>> get getpages {
    return [
      GetPage(
        name: "/splashview",
        page: () => const SplashView(),
      ),
      GetPage(
        name: "/mytest",
        page: () => const Mytestpage(),
      ),
      GetPage(
          name: "/onboarding",
          page: () => const OnBoardingView(),
          binding: BindingsBuilder(
            () => Get.lazyPut<OnboardingPagecontroller>(
              () => OnboardingPagecontroller(),
            ),
          )),
      GetPage(
        name: "/login",
        page: () => LoginPage(),
      ),
      GetPage(
        name: "/home",
        page: () => HomePage(),
      ),
      GetPage(
        name: "/signin",
        page: () => SigninPage(),
      ),
      GetPage(
        name: "/hijri",
        page: () => HijriCalender(),
      ),
      GetPage(
        name: "/settings",
        page: () => SettingPage(),
      ),
      GetPage(
        name: "/quraan",
        page: () => QuraanPage(),
      ),
      GetPage(
        name: "/adkar",
        page: () => AdkarPage(),
      ),
      GetPage(
        name: "/salattime",
        page: () => const PrayerTimesPage(),
        bindings: [
          BindingsBuilder(
            () => Get.put<FCMController>(FCMController(), permanent: true),
          ),
        ],
      ),
    ];
  }
}
