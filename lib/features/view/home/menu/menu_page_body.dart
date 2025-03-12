import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/skeletonizer.dart';
import 'package:project/features/controller/Auth%20controller/delet_account.dart';
import 'package:project/features/controller/Auth%20controller/logincontroller.dart';
import 'package:project/features/controller/home%20controller/fade_animation_controller.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';
import 'package:project/features/view/home/quraan%20page/favorite.dart';
import 'package:project/features/view/home/quraan%20page/saved_ayahs.dart';

class MenuPageBody extends StatelessWidget {
  MenuPageBody({super.key});
  final LogInController logctrl = Get.find();
  final MyHomeController homectrl = Get.find();
  final FadeAnimationController fadectrl = Get.find();
  final ThemeController themeCtrl = Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Stack(
            children: [
              Gradientbackground(
                gradientcolor: [
                  kmaincolor,
                  themeController.isDarkMode ? kmaincolor3dark : kmaincolor3,
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
              FadeInUp(
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
              ),
            ],
          ),
    );
  }

  Widget _buildSkeletonLayout(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder:
          (themeController) => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Myskeletonizer(
                    skeletonizerWidget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  themeController.isDarkMode
                                      ? kmaincolor3dark
                                      : kmaincolor3,
                              backgroundImage: const AssetImage(
                                "lib/core/assets/images/profile_picture/woman_picture.png",
                              ),
                              radius: 40,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'anonymous_user'.tr,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color:
                                    themeController.isDarkMode
                                        ? Colors.white70
                                        : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'no_email',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                color:
                                    themeController.isDarkMode
                                        ? Colors.white70
                                        : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
      future: _firestore.collection('users').doc(currentUser?.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildSkeletonLayout(context);
        }

        final userData = snapshot.data?.data() as Map<String, dynamic>?;
        final String displayName = userData?['displayName'] ?? "";
        final String email = currentUser?.email ?? 'no_email'.tr;
        final String gender = userData?['gendre'] ?? 'male';
        final String? photoURL = currentUser?.photoURL;
        final bool isAnonymous = currentUser?.isAnonymous ?? true;

        return GetBuilder<ThemeController>(
          builder:
              (themeController) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          themeController.isDarkMode
                              ? kmaincolor3dark
                              : kmaincolor3,
                      backgroundImage:
                          photoURL != null
                              ? NetworkImage(photoURL) as ImageProvider
                              : AssetImage(
                                isAnonymous
                                    ? "lib/core/assets/images/login_images/Guest.png"
                                    : gender == 'Female'
                                    ? "lib/core/assets/images/profile_picture/woman_picture.png"
                                    : "lib/core/assets/images/profile_picture/man_picture.png",
                              ),
                      radius: 40,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      isAnonymous ? 'anonymous_user'.tr : displayName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            themeController.isDarkMode
                                ? Colors.white70
                                : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email == 'no_email' ? 'no_email'.tr : email,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            themeController.isDarkMode
                                ? Colors.white70
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }

  Widget _buildMainMenuSection(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Column(
            children: [
              _buildSettingsCategory(
                icon: Icons.home_outlined,
                onTap: () {
                  homectrl.selected = 2;
                  homectrl.update();
                },
                title: 'home'.tr,
              ),
              _buildSettingsCategory(
                icon: Icons.book_outlined,
                onTap: () => Get.to(() => const SavedAyahs()),
                title: 'my_quran'.tr,
              ),
              _buildSettingsCategory(
                icon: Icons.favorite,
                onTap: () => Get.to(() => Favorite()),
                title: 'favorite'.tr,
              ),
              // _buildSettingsCategory(
              //     icon: Icons.info_outline,
              //     onTap: () => Get.toNamed("aboutus"),
              //     title: 'about_us'.tr),
              _buildSettingsCategory(
                icon: Icons.share_outlined,
                onTap: () => Get.toNamed("refferal"),
                title: 'refferal'.tr,
              ),
            ],
          ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    final DeletAccount deletAccount = Get.put<DeletAccount>(DeletAccount());

    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Column(
            children: [
              _buildSettingsCategory(
                icon: Icons.settings_outlined,
                onTap: () => Get.toNamed("settings"),
                title: 'settings'.tr,
              ),
              _buildSettingsCategory(
                icon: Icons.help_outline,
                onTap: () => Get.toNamed("help"),
                title: 'help_feedback'.tr,
              ),
              _buildSettingsCategory(
                widget:
                    deletAccount.isLoading.value
                        ? CircularProgressIndicator(
                          strokeWidth: 3,
                          strokeAlign: -4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Get.isDarkMode ? kmaincolor : kmaincolor4,
                          ),
                        )
                        : null,
                icon: Icons.logout_outlined,
                onTap: () {
                  deletAccount.isLoading.value
                      ? null
                      : FirebaseAuth.instance.currentUser!.isAnonymous
                      ? deletAccount.anonymousSignout(context)
                      : logctrl.signOut(context);
                },
                title: 'log_out'.tr,
              ),
            ],
          ),
    );
  }

  Widget _buildSettingsCategory({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? widget,
  }) {
    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            themeController.isDarkMode
                                ? kmaincolor4.withValues(alpha: 0.2)
                                : kmaincolor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          widget ??
                          Icon(
                            icon,
                            color:
                                themeController.isDarkMode
                                    ? kmaincolor4
                                    : kmaincolor,
                            size: 24,
                          ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            themeController.isDarkMode
                                ? const Color.fromARGB(255, 237, 231, 223)
                                : const Color(0xFF2C3E50),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 24,
                      color:
                          themeController.isDarkMode
                              ? Colors.white70
                              : Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                Text(
                  'app_version'.tr,
                  style: TextStyle(
                    fontSize: 10,
                    color:
                        themeController.isDarkMode
                            ? Colors.white70
                            : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
