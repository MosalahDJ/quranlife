import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ComplainController extends GetxController {
  Future<void> launchTelegram() async {
    final Uri telegramUri = Uri.parse('https://t.me/0655663020');

    try {
      if (!await launchUrl(
        telegramUri,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch Telegram';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open Telegram',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> launchEmail() async {
    final String subject = Uri.decodeComponent('Support Request');
    final String body = Uri.decodeComponent('Hello, I need help with...');

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mohamedsalah2403@gmail.com',
      queryParameters: {'subject': subject, 'body': body},
    );

    try {
      if (!await launchUrl(emailLaunchUri)) {
        throw 'Could not launch email';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open email app',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
