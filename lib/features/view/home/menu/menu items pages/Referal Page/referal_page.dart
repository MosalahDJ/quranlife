import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';

class RefferalPage extends StatelessWidget {
  RefferalPage({super.key});
  final UrlLuncherAndSharingController urllunchctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: 'referral_page'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
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
        ],
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context) {
    return Card(
      elevation: 4,
      color:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.card_giftcard,
              size: 50,
              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
            ),
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
      color:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.7),
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
                  color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                ),
              ),
              child: ListTile(
                title: const Text(
                  "https://quranlife.app/refer/user123",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                  ),
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(
                        text: "https://quranlife.app/refer/username",
                      ),
                    );
                    Get.snackbar(
                      'Success',
                      'Link copied to clipboard',
                      colorText: Get.isDarkMode ? Colors.white : Colors.black,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: kmaincolor.withValues(alpha: 0.1),
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
      color:
          Get.isDarkMode
              ? kmaincolor2dark.withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.7),
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
                          color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                        ),
                        color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          fit: BoxFit.contain,
                          "lib/core/assets/images/login_images/share.png",
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
    BuildContext context,
    String asset,
    VoidCallback onPressed,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
            ),
            color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(asset, height: 40, width: 40),
          ),
        ),
      ),
    );
  }
}
