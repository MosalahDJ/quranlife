import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quranlife/core/Utils/binding.dart';
import 'package:quranlife/core/Utils/thems.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/notification_controller.dart';
import 'package:quranlife/features/view/auth/login%20page/loginpage.dart';
import 'package:quranlife/features/view/auth/signin%20page/signin_page.dart';
import 'package:quranlife/features/view/home/home_page.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/history_page.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/settings%20page/setting_page.dart';
import 'package:quranlife/features/view/home/salat%20time/prayer_time_page.dart';
import 'package:quranlife/features/view/onboarding%20pages/on_boarding_view.dart';
import 'package:quranlife/features/view/splash%20page/splash_view.dart';
import 'package:quranlife/features/controller/Auth%20controller/settingscontroller.dart';
import 'package:quranlife/features/controller/more%20controllers/historycontroller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const QuranLifeApp());
}

class QuranLifeApp extends StatelessWidget {
  const QuranLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.isPlatformDarkMode ? Themes().darkmode : Themes().lightmode,
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
        name: "/onboarding",
        page: () => const OnBoardingView(),
      ),
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
          name: "/history",
          page: () => HistoryPage(),
          binding: BindingsBuilder(
            () => Get.lazyPut<HistoryController>(
              () => HistoryController(),
            ),
          )),
      GetPage(
          name: "/settings",
          page: () => SettingPage(),
          binding: BindingsBuilder(
            () => Get.put<Settingscontroller>(Settingscontroller(),
                permanent: true),
          )),
      GetPage(
        name: "/salattime",
        page: () => const PrayerTimesPage(),
        bindings: [
          BindingsBuilder(
            () => Get.put<NotificationController>(NotificationController(),
                permanent: true),
          ),
        ],
      ),
    ];
  }
}
