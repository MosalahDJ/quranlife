import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ComplainController extends GetxController {
  void launchWhatsApp() async {
    const url = 'https://wa.me/YOUR_PHONE_NUMBER';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void launchEmail() async {
    const url = 'mailto:support@quranlife.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
