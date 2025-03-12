import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/core/Utils/binding.dart';
import 'package:project/core/localization/translations.dart';
import 'package:project/core/theme/thems.dart';
import 'package:project/features/controller/settings%20controllers/language_controller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';
import 'package:project/features/view/splash%20page/splash_view.dart';
import 'package:project/myrouts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

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
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    dotenv.load(fileName: ".env"),
  ]);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  if (kReleaseMode) {
    await SentryFlutter.init((options) {
      options.dsn =
          'https://ffbe2284578ddb220992bfafac17ac6c@o4508945405313024.ingest.de.sentry.io/4508945417371728';
    }, appRunner: () => runApp(SentryWidget(child: QuranLifeApp(prefs: prefs))));
  } else {
    runApp(QuranLifeApp(prefs: prefs));
  }
}

class QuranLifeApp extends StatelessWidget {
  final SharedPreferences prefs;
  const QuranLifeApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put<ThemeController>(
      ThemeController(),
      permanent: true,
    );
    final languageController = Get.put<LanguageController>(
      LanguageController(prefs),
      permanent: true,
    );

    return GetMaterialApp(
      title: 'QuranLife',

      theme: Themes().lightmode,
      darkTheme: Themes().darkmode,
      //using thememode for changing theme whene user change selected theme value
      themeMode:
          themeController.selectedTheme.value == AppTheme.system
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
