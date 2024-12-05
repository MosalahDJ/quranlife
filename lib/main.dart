import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quranlife/core/Utils/binding.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';
import 'package:quranlife/features/controller/settings%20controllers/theme_controller.dart';
import 'package:quranlife/features/view/splash%20page/splash_view.dart';
import 'package:quranlife/myrouts.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    NotificationController.initialiseNotification(),
    dotenv.load(fileName: ".env"),
  ]);
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
      getPages: Myrouts.getpages,
    );
  }
}
