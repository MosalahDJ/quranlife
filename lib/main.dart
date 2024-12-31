import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quranlife/core/Utils/binding.dart';
import 'package:quranlife/core/Utils/thems.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_initializition.dart';
import 'package:quranlife/features/controller/settings%20controllers/language_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/view/splash%20page/splash_view.dart';
import 'package:quranlife/myrouts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:quranlife/core/localization/translations.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  // Force portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    NotificationController.initialiseNotification(),
    dotenv.load(fileName: ".env"),
  ]);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(QuranLifeApp(prefs: prefs));
}

class QuranLifeApp extends StatelessWidget {
  final SharedPreferences prefs;
  const QuranLifeApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    final themeController =
        Get.put<ThemeController>(ThemeController(), permanent: true);
    final languageController =
        Get.put<LanguageController>(LanguageController(prefs), permanent: true);

    return GetMaterialApp(
      title: 'Quran Life',

      theme: Themes().lightmode,
      darkTheme: Themes().darkmode,
      //using thememode for changing theme whene user change selected theme value
      themeMode: themeController.selectedTheme.value == AppTheme.system
          ? ThemeMode.system
          : themeController.selectedTheme.value == AppTheme.light
              ? ThemeMode.light
              : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialBinding: Mybinding(),
      home: const SplashView(),
      getPages: Myrouts.getpages,
      translations: Messages(),
      locale: Locale(languageController.language.value), // Use stored language
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
