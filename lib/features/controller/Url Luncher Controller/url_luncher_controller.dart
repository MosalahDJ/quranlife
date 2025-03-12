import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLuncherAndSharingController extends GetxController {
  // Add share text constants
  final String shareText = "Check out Quran Life App! 🌟\n\n"
      "Download this amazing Islamic app that helps you with prayer times, "
      "Quran reading, and more spiritual features.\n\n"
      "Download now from: https://play.google.com/store/apps/yourapplink";

  // Share functions
  Future<void> shareOnFacebook() async {
    final String url =
        'https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent("https://play.google.com/store/apps/yourapplink")}&quote=${Uri.encodeComponent(shareText)}';
    launchurl(url);
  }

  Future<void> shareOnTwitter() async {
    final String url =
        'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(shareText)}';
    launchurl(url);
  }

  Future<void> shareOnInstagram() async {
    // Instagram doesn't support direct sharing via URL
    // Copy to clipboard instead
    await Clipboard.setData(ClipboardData(text: shareText));
    Get.snackbar(
      'Link Copied!',
      'Share the copied text on Instagram',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Add native share method
  Future<void> shareWithAnyApp() async {
    try {
      await Share.share(shareText);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not share content',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

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
