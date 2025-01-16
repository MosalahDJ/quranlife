import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody({super.key});
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
            opacity: const AlwaysStoppedAnimation<double>(0.2),
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
        _buildMenuItem(
            context, 'home'.tr, Icons.home_outlined, () => Get.toNamed("home")),
        _buildMenuItem(context, 'my_quran'.tr, Icons.book_outlined,
            () => Get.toNamed("quraan")),
        _buildMenuItem(context, 'bookmarks'.tr, Icons.bookmark_border,
            () => Get.toNamed("adkar")),
        _buildMenuItem(context, 'about_us'.tr, Icons.info_outline,
            () => Get.toNamed("aboutus")),
        _buildMenuItem(context, 'refferal'.tr, Icons.share_outlined,
            () => Get.toNamed("refferal")),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(context, 'settings'.tr, Icons.settings_outlined,
            () => Get.toNamed("settings")),
        _buildMenuItem(context, 'help_feedback'.tr, Icons.help_outline,
            () => Get.toNamed("help")),
        _buildMenuItem(context, 'log_out'.tr, Icons.logout_outlined,
            () => logctrl.signOut(context)),
      ],
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, ontap) {
    return ListTile(
      leading:
          Icon(icon, color: Get.isDarkMode ? Colors.white70 : Colors.black87),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Get.isDarkMode ? Colors.white70 : Colors.black87,
            ),
      ),
      onTap: ontap,
    );
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
}
