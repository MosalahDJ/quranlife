import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLuncherController extends GetxController {
  Future<void> launchurl(String url) async {
    final uri = Uri.parse(url);

    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch Site';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open Site',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> launchEmail() async {
    final String subject = Uri.decodeComponent('');
    final String body = Uri.decodeComponent('');

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
