import 'package:flutter/material.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';
import 'package:project/features/view/home/categories/categories_pages/messaging_page.dart';

class ComplainPage extends StatelessWidget {
  ComplainPage({super.key});
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
          text: 'contact_us'.tr,
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
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Header Section
                  _buildHeaderSection(),
                  // Main Contact Options
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildContactOption(
                          title: 'direct_message'.tr,
                          icon: Icons.message_rounded,
                          onTap: () => Get.to(() => const MessagingPage()),
                        ),
                        _buildContactOption(
                          title: 'telegram'.tr,
                          icon: Icons.telegram,
                          color: const Color.fromARGB(255, 34, 158, 225),
                          onTap:
                              () => urllunchctrl.launchurl(
                                'https://t.me/0655663020',
                              ),
                        ),
                        _buildContactOption(
                          title: 'email'.tr,
                          icon: Icons.email_rounded,
                          color: Colors.red,
                          onTap: () => urllunchctrl.launchEmail(),
                        ),
                      ],
                    ),
                  ),
                  // Address Section
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:
                          Get.isDarkMode
                              ? kmaincolordark.withValues(alpha: 0.7)
                              : Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.location_on, color: kmaincolor),
                          title: Text('address'.tr),
                          subtitle: Text('address_details'.tr),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:
            Get.isDarkMode
                ? kmaincolordark.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.7),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'how_can_we_help'.tr,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'contact_description'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color:
                  Get.isDarkMode
                      ? Colors.white.withValues(alpha: 0.9)
                      : Colors.black.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color:
            Get.isDarkMode
                ? kmaincolordark.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Row(
              children: [
                Icon(icon, size: 30, color: color ?? kmaincolor),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
