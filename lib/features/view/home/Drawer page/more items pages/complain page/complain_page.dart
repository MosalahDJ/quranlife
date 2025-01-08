import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';

class ComplainPage extends StatelessWidget {
  ComplainPage({super.key});
  final UrlLuncherController urllunchctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'contact_us'.tr,
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: Get.isDarkMode
                ? [
                    kmaincolor3dark,
                    kmaincolor3dark.withOpacity(0.8),
                    kmaincolor3dark.withOpacity(0.6),
                  ]
                : [
                    kmaincolor3,
                    kmaincolor3.withOpacity(0.8),
                    kmaincolor3.withOpacity(0.6),
                  ],
          ),
        ),
        child: SafeArea(
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
                        onTap: () => _showMessageDialog(context),
                      ),
                      _buildContactOption(
                        title: 'telegram'.tr,
                        icon: Icons.telegram,
                        color: const Color.fromARGB(255, 34, 158, 225),
                        onTap: () =>
                            urllunchctrl.launchurl('https://t.me/0655663020'),
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
                    color: Get.isDarkMode ? kmaincolordark : Colors.white,
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
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
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
              color: Get.isDarkMode
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black.withOpacity(0.9),
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
        color: Get.isDarkMode ? kmaincolordark : Colors.white,
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

  void _showMessageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: kmaincolor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          padding: const EdgeInsets.all(20),
          height: Sizeconfig.screenheight! / 5,
          width: Sizeconfig.screenwidth! / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Support Request",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Open Direct message page and send your question.",
                style: TextStyle(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                          height: Sizeconfig.screenheight! / 35,
                          width: Sizeconfig.screenwidth! / 5,
                          child: SizedBox(
                              height: Sizeconfig.screenheight! / 35,
                              width: Sizeconfig.screenwidth! / 4,
                              child: Text(
                                "cancel",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 16, color: kmaincolor4),
                              )))),
                  ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                          height: Sizeconfig.screenheight! / 35,
                          width: Sizeconfig.screenwidth! / 5,
                          child: SizedBox(
                              height: Sizeconfig.screenheight! / 35,
                              width: Sizeconfig.screenwidth! / 4,
                              child: Text(
                                "ok",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 16, color: kmaincolor),
                              )))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
