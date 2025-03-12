import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/Auth%20controller/delet_account.dart';
import 'package:project/features/controller/Auth%20controller/logincontroller.dart';
import 'package:project/features/controller/Auth%20controller/passwordresset.dart';
import 'package:project/features/controller/settings%20controllers/theme_controller.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController changpassemailController =
      TextEditingController();

  final ThemeController themeCtrl = Get.find();
  final LogInController logCtrl = Get.find();
  final PasswordresetController passCtrl = Get.put<PasswordresetController>(
    PasswordresetController(),
  );

  final RxBool isMale = true.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: kmaincolor,
            elevation: 0,
            centerTitle: true,
            title: ShimmerText(
              text: 'edit_profile'.tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(context, 'personal_info'.tr),
                _buildTextInput(
                  context: context,
                  controller: firstNameController,
                  icon: Icons.person_outline,
                  label: 'first_name'.tr,
                  hint: 'enter_first_name'.tr,
                ),
                _buildTextInput(
                  context: context,
                  controller: lastNameController,
                  icon: Icons.person_outline,
                  label: 'last_name'.tr,
                  hint: 'enter_last_name'.tr,
                ),
                _buildGenderSelection(context),
                _buildSaveButton(context),
                _buildSectionHeader(context, 'password'.tr),
                _buildChangePasswordButton(context),
                _buildSectionHeader(context, 'delete_account'.tr),
                _buildDeleteAccountButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color:
                  themeController.isDarkMode
                      ? kmaincolor4.withValues(alpha: 0.8)
                      : kmaincolor.withValues(alpha: 0.8),
              letterSpacing: 0.5,
            ),
          ),
        );
      },
    );
  }

  // Add this method to the EditProfilePage class
  Widget _buildDeleteAccountButton(BuildContext context) {
    final DeletAccount deletAccount = Get.put<DeletAccount>(DeletAccount());

    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton.icon(
            onPressed: () {
              deletAccount.isLoading.value
                  ? null
                  : deletAccount.deleteUserAccount(context);
            },
            icon: Icon(Icons.delete_forever, color: Colors.red.shade600),
            label: Text(
              'delete_account'.tr,
              style: TextStyle(
                color: Colors.red.shade600,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextButton.styleFrom(
              fixedSize: Size(
                Sizeconfig.screenwidth!,
                Sizeconfig.screenheight! / 15,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              backgroundColor:
                  themeController.isDarkMode
                      ? Colors.red.shade900.withValues(alpha: 0.2)
                      : Colors.red.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }

  // Add this method to the EditProfilePage class
  Widget _buildChangePasswordButton(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final accentColor =
            themeController.isDarkMode ? kmaincolor4 : kmaincolor;
        final textColor =
            themeController.isDarkMode ? Colors.grey[300] : Colors.grey[700];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton.icon(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.scale,
                title: 'reset_password'.tr,
                desc: 'reset_password_desc'.tr,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: changpassemailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'enter_email'.tr,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: accentColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                btnCancelText: 'cancel'.tr,
                btnOkText: 'send'.tr,
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  passCtrl.resetpassword(
                    context,
                    changpassemailController.text,
                  );
                },
              ).show();
            },
            icon: Icon(Icons.lock_outline, color: accentColor),
            label: Text(
              'change_password'.tr,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              backgroundColor:
                  themeController.isDarkMode
                      ? Colors.grey[800]
                      : Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextInput({
    required BuildContext context,
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final accentColor =
            themeController.isDarkMode ? kmaincolor4 : kmaincolor;
        final labelColor =
            themeController.isDarkMode ? Colors.grey[300] : Colors.grey[600];
        final fillColor =
            themeController.isDarkMode ? Colors.grey[800] : Colors.grey[50];
        final borderColor =
            themeController.isDarkMode
                ? kmaincolor4.withValues(alpha: 0.3)
                : kmaincolor.withValues(alpha: 0.3);
        final hintColor =
            themeController.isDarkMode ? Colors.grey[500] : Colors.grey[400];
        final textColor =
            themeController.isDarkMode
                ? const Color.fromARGB(255, 207, 165, 118)
                : const Color(0xFF2C3E50);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller,
                keyboardType: keyboardType,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, color: accentColor),
                  hintText: hint,
                  hintStyle: TextStyle(color: hintColor),
                  filled: true,
                  fillColor: fillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: accentColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderSelection(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final labelColor =
            themeController.isDarkMode ? Colors.grey[300] : Colors.grey[600];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'gender'.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => _buildGenderOption(
                        context,
                        Icons.male,
                        'male'.tr,
                        isMale.value,
                        () => isMale.value = true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(
                      () => _buildGenderOption(
                        context,
                        Icons.female,
                        'female'.tr,
                        !isMale.value,
                        () => isMale.value = false,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderOption(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final accentColor =
            themeController.isDarkMode ? kmaincolor4 : kmaincolor;
        final borderColor =
            isSelected
                ? accentColor
                : (themeController.isDarkMode
                    ? Colors.grey.withValues(alpha: 0.5)
                    : Colors.grey.withValues(alpha: 0.3));
        final bgColor =
            isSelected
                ? (themeController.isDarkMode
                    ? kmaincolor4.withValues(alpha: 0.1)
                    : kmaincolor.withValues(alpha: 0.1))
                : (themeController.isDarkMode
                    ? Colors.grey[800]
                    : Colors.transparent);
        final textColor =
            isSelected
                ? (themeController.isDarkMode
                    ? const Color.fromARGB(255, 207, 165, 118)
                    : kmaincolor)
                : (themeController.isDarkMode
                    ? Colors.grey[300]
                    : Colors.grey[600]);

        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(10),
              color: bgColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: textColor),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final accentColor =
            themeController.isDarkMode ? kmaincolor4 : kmaincolor;
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                logCtrl.updateUserProfile(
                  context: context,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  isMale: isMale.value,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 52),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'save_changes'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
