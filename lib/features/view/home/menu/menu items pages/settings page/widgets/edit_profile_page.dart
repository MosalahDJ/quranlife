import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(context, 'personal_info'.tr),
            _buildTextInput(
              context: context,
              controller: nameController,
              icon: Icons.person_outline,
              label: 'full_name'.tr,
              hint: 'enter_name'.tr,
            ),
            _buildTextInput(
              context: context,
              controller: emailController,
              icon: Icons.email_outlined,
              label: 'email'.tr,
              hint: 'enter_email'.tr,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextInput(
              context: context,
              controller: phoneController,
              icon: Icons.phone_outlined,
              label: 'phone'.tr,
              hint: 'enter_phone'.tr,
              keyboardType: TextInputType.phone,
            ),
            _buildGenderSelection(context),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kmaincolor.withOpacity(0.8),
          letterSpacing: 0.5,
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: kmaincolor),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kmaincolor.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kmaincolor.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kmaincolor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'gender'.tr,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildGenderOption(
                  context,
                  Icons.male,
                  'male'.tr,
                  true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildGenderOption(
                  context,
                  Icons.female,
                  'female'.tr,
                  false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(
      BuildContext context, IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? kmaincolor : Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? kmaincolor.withOpacity(0.1) : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: isSelected ? kmaincolor : Colors.grey.withOpacity(0.7)),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? kmaincolor : Colors.grey.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          // Implement save functionality
          Get.snackbar(
            'success'.tr,
            'profile_updated'.tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kmaincolor,
            colorText: Colors.white,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kmaincolor,
          minimumSize: const Size(double.infinity, 50),
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
    );
  }
}
