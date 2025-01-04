import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';

class MyDrawer extends Drawer {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Sizeconfig.screenwidth! / 1.19,
      backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
      child: Column(
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
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? kmaincolor3dark.withOpacity(0.9)
            : kmaincolor3.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage:
                AssetImage("lib/core/assets/images/more_page_images/me.png"),
            radius: 40,
          ),
          const SizedBox(height: 12),
          Text(
            "Mohamed Salah",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            "mohamedsalah@gmail.com",
            style: Theme.of(context).textTheme.bodyMedium,
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
      ],
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, ontap) {
    return ListTile(
      leading:
          Icon(icon, color: Get.isDarkMode ? Colors.white70 : Colors.black54),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
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
