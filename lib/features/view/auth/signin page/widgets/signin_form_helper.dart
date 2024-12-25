import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/widgets/information_form.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';

// Helper class for sign-in form widgets
class SignInFormHelpers {
  final SignInController signinctrl = Get.find();

  // Creates a standard form field with validation
  Widget buildFormField(
    BuildContext context, {
    required String title,
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
        hint: "Enter your $title",
        keyboardtype: keyboardType ?? TextInputType.text,
        obsecure: false,
        isrequired: true,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return '$title is required';
          }
          if (title == "Email" && !GetUtils.isEmail(val)) {
            return 'Please enter a valid email address';
          }
          if (title == "Password" && val.length < 6) {
            return 'Password must be at least 6 characters';
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
        focusnode: signinctrl.numberfnode,
        isrequired: true,
        formtitle: "Gender",
        hint: "Select your gender",
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
              value: signinctrl.gendre.text.isEmpty
                  ? null
                  : signinctrl.gendre.text,
              hint: Text(
                "Select gender",
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
                    "Male",
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? Colors.white
                          : const Color(0xFF3D3825),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "Female",
                  child: Text(
                    "Female",
                    style: TextStyle(
                      color: Get.isDarkMode
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
            return 'Gender is required';
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
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
    required bool isConfirmation,
  }) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: InformationsForm(
        focusnode: isConfirmation
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
        suffixbutton: GetBuilder<SignInController>(
          builder: (c) => IconButton(
            onPressed: isConfirmation
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
        ),
        isrequired: true,
        textctrl: controller,
        formtitle: title,
        hint: "Enter your $title",
        keyboardtype: TextInputType.emailAddress,
        obsecure:
            isConfirmation ? signinctrl.visibility2 : signinctrl.visibility,
      ),
    );
  }
}
