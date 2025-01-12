import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';

class RefferalPage extends StatelessWidget {
  RefferalPage({super.key});
  final UrlLuncherAndSharingController urllunchctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text('referral_page'.tr,
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: Sizeconfig.screenheight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              "lib/core/assets/images/background_image/islamic_patern.jpg",
            ),
            opacity: 0.1,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Get.isDarkMode ? Colors.black54 : Colors.white54,
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildRewardCard(context),
                const SizedBox(height: 20),
                _buildReferralLinkCard(context),
                const SizedBox(height: 20),
                _buildSocialSharingSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context) {
    return Card(
      elevation: 4,
      color: Get.isDarkMode
          ? kmaincolor2dark.withOpacity(0.5)
          : Colors.white.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.card_giftcard,
                size: 50, color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
            const SizedBox(height: 10),
            Text(
              'share_app'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'share_description'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferralLinkCard(BuildContext context) {
    return Card(
      elevation: 4,
      color: Get.isDarkMode
          ? kmaincolor2dark.withOpacity(0.5)
          : Colors.white.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'your_referral_link'.tr,
              style: TextStyle(
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
              ),
              child: ListTile(
                title: const Text(
                  "https://quranlife.app/refer/user123",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.copy,
                      color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(
                        text: "https://quranlife.app/refer/user123"));
                    Get.snackbar(
                      'Success',
                      'Link copied to clipboard',
                      colorText: Get.isDarkMode ? Colors.white : Colors.black,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: kmaincolor.withOpacity(0.1),
                      duration: const Duration(seconds: 2),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialSharingSection(BuildContext context) {
    return Card(
      elevation: 4,
      color: Get.isDarkMode
          ? kmaincolor2dark.withOpacity(0.5)
          : Colors.white.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'or_share_with'.tr,
              style: TextStyle(
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAnimatedSocialButton(
                  context,
                  "lib/core/assets/images/login_images/Facebook.png",
                  () {
                    urllunchctrl.shareOnFacebook();
                  },
                ),
                _buildAnimatedSocialButton(
                  context,
                  "lib/core/assets/images/login_images/X.png",
                  () {
                    urllunchctrl.shareOnTwitter();
                  },
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: InkWell(
                    onTap: () {
                      urllunchctrl.shareWithAnyApp();
                    },
                    borderRadius: BorderRadius.circular(25),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
                        color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "lib/core/assets/images/login_images/share.png",
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSocialButton(
      BuildContext context, String asset, VoidCallback onPressed) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border:
                Border.all(color: Get.isDarkMode ? kmaincolor4 : kmaincolor),
            color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              asset,
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}
