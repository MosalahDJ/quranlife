import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';

class MenuPageBody extends StatelessWidget {
  MenuPageBody({super.key});
  final LogInController logctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Gradientbackground(
          gradientcolor: [
            kmaincolor,
            Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
          ],
        ),
        SizedBox(
          height: Sizeconfig.screenheight,
          width: Sizeconfig.screenwidth,
          child: Image.asset(
            "lib/core/assets/images/background_image/arch.jpg",
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation<double>(0.1),
            height: Sizeconfig.screenheight,
            width: Sizeconfig.screenwidth,
          ),
        ),
        Column(
          children: [
            _buildProfileHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMainMenuSection(context),
                    const Divider(thickness: 0.5),
                    _buildSettingsSection(context),
                  ],
                ),
              ),
            ),
            _buildBottomSection(context),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            backgroundImage: const AssetImage(
              "lib/core/assets/images/background_image/islamic_patern_portrait.jpg",
            ),
            radius: 40,
          ),
          const SizedBox(height: 12),
          Text(
            "Mohamed Salah",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white70 : Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            "mohamedsalah@gmail.com",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Get.isDarkMode ? Colors.white70 : Colors.black,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenuSection(BuildContext context) {
    return Column(
      children: [
        _buildSettingsCategory(
            icon: Icons.home_outlined,
            onTap: () => Get.toNamed("home"),
            title: 'home'.tr),
        _buildSettingsCategory(
            icon: Icons.book_outlined,
            onTap: () => Get.toNamed("quraan"),
            title: 'my_quran'.tr),
        _buildSettingsCategory(
            icon: Icons.bookmark_border,
            onTap: () => Get.toNamed("adkar"),
            title: 'bookmarks'.tr),
        _buildSettingsCategory(
            icon: Icons.info_outline,
            onTap: () => Get.toNamed("aboutus"),
            title: 'about_us'.tr),
        _buildSettingsCategory(
            icon: Icons.share_outlined,
            onTap: () => Get.toNamed("refferal"),
            title: 'refferal'.tr),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      children: [
        _buildSettingsCategory(
            icon: Icons.settings_outlined,
            onTap: () => Get.toNamed("settings"),
            title: 'settings'.tr),
        _buildSettingsCategory(
            icon: Icons.help_outline,
            onTap: () => Get.toNamed("help"),
            title: 'help_feedback'.tr),
        _buildSettingsCategory(
            icon: Icons.logout_outlined,
            onTap: () => logctrl.signOut(context),
            title: 'log_out'.tr),
      ],
    );
  }

  Widget _buildSettingsCategory({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? kmaincolor4.withOpacity(0.2)
                      : kmaincolor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon,
                    color: Get.isDarkMode ? kmaincolor4 : kmaincolor, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode
                      ? const Color.fromARGB(255, 207, 165, 118)
                      : const Color(0xFF2C3E50),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.chevron_right_rounded,
                size: 24,
                color: Colors.grey[700],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBottomSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Text('app_version'.tr,
            style: TextStyle(
                fontSize: 10,
                color: Get.isDarkMode ? Colors.white : Colors.black)),
      ],
    ),
  );
}
