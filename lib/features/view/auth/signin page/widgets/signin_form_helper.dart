import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/widgets/information_form.dart';
import 'package:project/features/controller/Auth%20controller/signncontroller.dart';

// Helper class for sign-in form widgets
class SignInFormHelpers {
  final SignInController signinctrl = Get.put<SignInController>(
    SignInController(),
  );

  // Creates a standard form field with validation
  Widget buildFormField(
    BuildContext context, {
    required String title,
    required String hint,
    required TextEditingController controller,
    required FocusNode focusNode,
    required GlobalKey<FormState> formKey,
    TextInputType? keyboardType,
  }) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: InformationsForm(
        textctrl: controller,
        focusnode: focusNode,
        formtitle: title,
        hint: hint,
        keyboardtype: keyboardType ?? TextInputType.text,
        obsecure: false,
        isrequired: true,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'field_required'.tr;
          }
          if (title == "Email" && !GetUtils.isEmail(val)) {
            return 'valid_email'.tr;
          }
          if (title == "Password" && val.length < 6) {
            return 'password_length'.tr;
          }
          return null;
        },
      ),
    );
  }

  // Creates a gender selection dropdown with theme-aware styling
  Widget buildGenderDropdown() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: signinctrl.txtvalctrl.signingendrestate,
      child: InformationsForm(
        textctrl: signinctrl.gendre,
        focusnode: signinctrl.gendrefnode,
        isrequired: true,
        formtitle: "gender".tr,
        hint: "select_gender".tr,
        keyboardtype: TextInputType.none,
        obsecure: false,
        suffixbutton: DropdownButtonHideUnderline(
          child: Theme(
            data: Theme.of(Get.context!).copyWith(
              dropdownMenuTheme: DropdownMenuThemeData(
                textStyle: TextStyle(
                  color:
                      Get.isDarkMode ? Colors.white : const Color(0xFF3D3825),
                ),
              ),
            ),
            child: DropdownButton<String>(
              value:
                  signinctrl.gendre.text.isEmpty
                      ? null
                      : signinctrl.gendre.text,
              hint: Text(
                "select_gender".tr,
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? kmaincolor4 : kmaincolor3dark,
              ),
              dropdownColor: Get.isDarkMode ? kmaincolor3dark : Colors.white,
              items: [
                DropdownMenuItem(
                  value: "Male",
                  child: Text(
                    "male".tr,
                    style: TextStyle(
                      color:
                          Get.isDarkMode
                              ? Colors.white
                              : const Color(0xFF3D3825),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "Female",
                  child: Text(
                    "female".tr,
                    style: TextStyle(
                      color:
                          Get.isDarkMode
                              ? Colors.white
                              : const Color(0xFF3D3825),
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                signinctrl.gendre.text = value ?? '';
              },
            ),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'field_required'.tr;
          }
          return null;
        },
      ),
    );
  }

  // Creates a password field with visibility toggle and validation
  Widget buildPasswordField(
    BuildContext context, {
    required String title,
    required String hint,
    required bool obsecure,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
    required bool isConfirmation,
  }) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: InformationsForm(
        focusnode:
            isConfirmation
                ? signinctrl.passwordfnodesign2
                : signinctrl.passwordfnodesign,
        lines: 1,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return isConfirmation
                ? 'Please confirm your password'
                : 'Password is required';
          }
          if (!isConfirmation && val.length < 6) {
            return 'Password must be at least 6 characters';
          }
          if (isConfirmation && val != signinctrl.password.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        suffixbutton: IconButton(
          onPressed:
              isConfirmation
                  ? signinctrl.visibilityfunc2
                  : signinctrl.visibilityfunc,
          icon: Icon(
            isConfirmation
                ? (signinctrl.visibility2
                    ? Icons.visibility_off
                    : Icons.visibility)
                : (signinctrl.visibility
                    ? Icons.visibility_off
                    : Icons.visibility),
            color: Get.isDarkMode ? Colors.white : const Color(0xFF3D3825),
          ),
        ),
        isrequired: true,
        textctrl: controller,
        formtitle: title,
        hint: hint,
        keyboardtype: TextInputType.emailAddress,
        obsecure: obsecure,
      ),
    );
  }
}
