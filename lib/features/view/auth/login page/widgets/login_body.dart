import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/information_form.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/Auth%20controller/anonymous_sign_in.dart';
import 'package:quranlife/features/view/auth/signin%20page/signin_page.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/googlelogincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:animate_do/animate_do.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final LogInController loginctrl = Get.find();
  final GoogleLogInController googlectrl = Get.find();

  final Txtvalcontroller txtvalctrl = Get.find();
  final PasswordresetController passreset = Get.find();
  final AnonymouslysignIn authCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizeconfig.screenwidth! * 0.06,
              vertical: Sizeconfig.screenheight! * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Title Section
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: Sizeconfig.screenheight! * 0.04),
                        Image.asset(
                          "lib/core/assets/images/app_logo/pnglogo.png",
                          height: Sizeconfig.screenheight! * 0.2,
                        ),
                        const SizedBox(height: 16),
                        ShimmerText(
                          text: "quran_life".tr,
                          style: TextStyle(
                            color: Get.isDarkMode
                                ? const Color(0xFFE5AB57)
                                : const Color(0xFF3D3825),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Sizeconfig.screenheight! * 0.04),
                      ],
                    ),
                  ),
                ),

                // Form Section
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: txtvalctrl.loginemailstate,
                          child: InformationsForm(
                            focusnode: loginctrl.emailfnodelog,
                            keyboardtype: TextInputType.emailAddress,
                            validator: (val) =>
                                val!.isEmpty ? "please_enter_email".tr : null,
                            isrequired: true,
                            textctrl: loginctrl.emailcontroller,
                            formtitle: "email".tr,
                            hint: "enter_email".tr,
                            prefixicon: Icon(Icons.email_outlined,
                                color:
                                    Get.isDarkMode ? kmaincolor4 : kmaincolor),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Form(
                          key: txtvalctrl.loginpasswordstate,
                          child: GetBuilder<LogInController>(
                            builder: (controller) => InformationsForm(
                              focusnode: loginctrl.passwordfnodelog,
                              suffixbutton: IconButton(
                                onPressed: loginctrl.visibilityfunc,
                                icon: Icon(
                                  loginctrl.visibility
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:
                                      Get.isDarkMode ? kmaincolor4 : kmaincolor,
                                ),
                              ),
                              prefixicon: Icon(Icons.lock_outline,
                                  color: Get.isDarkMode
                                      ? kmaincolor4
                                      : kmaincolor),
                              lines: 1,
                              obsecure: loginctrl.visibility,
                              validator: (val) => val!.isEmpty
                                  ? "please_enter_password".tr
                                  : null,
                              isrequired: true,
                              textctrl: loginctrl.passwordcontroller,
                              formtitle: "password".tr,
                              hint: "enter_password".tr,
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              loginctrl.unfocuskeyboardlogin();
                              passreset.resetpassword(
                                  context, loginctrl.emailcontroller.text);
                            },
                            child: Text(
                              "forgot_password".tr,
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? kmaincolor4
                                      : kmaincolor),
                            ),
                          ),
                        ),

                        SizedBox(height: Sizeconfig.screenheight! * 0.02),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Get.isDarkMode ? kmaincolor4 : kmaincolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              if (txtvalctrl.loginemailstate.currentState!
                                      .validate() &&
                                  txtvalctrl.loginpasswordstate.currentState!
                                      .validate()) {
                                loginctrl.unfocuskeyboardlogin();
                                loginctrl.login(context);
                              }
                            },
                            child: Obx(
                              () => loginctrl.isLoading.value
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                      Get.isDarkMode ? kmaincolor : kmaincolor4,
                                    ))
                                  : Text(
                                      "login".tr,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // Social Login Section
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      SizedBox(height: Sizeconfig.screenheight! * 0.03),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  color: Get.isDarkMode
                                      ? kmaincolor4.withOpacity(0.5)
                                      : kmaincolor.withOpacity(0.5))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "or_login_with".tr,
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? kmaincolor4.withOpacity(0.8)
                                      : kmaincolor.withOpacity(0.8)),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                                  color: Get.isDarkMode
                                      ? kmaincolor4.withOpacity(0.5)
                                      : kmaincolor.withOpacity(0.5))),
                        ],
                      ),
                      SizedBox(height: Sizeconfig.screenheight! * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => googlectrl.isLoading.value
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                  Get.isDarkMode ? kmaincolor4 : kmaincolor,
                                ))
                              : _buildSocialButton(
                                  "lib/core/assets/images/login_images/google.png",
                                  () => googlectrl.signInWithGoogle(context),
                                  Colors.transparent)),
                          const SizedBox(width: 30),
                          Obx(
                            () => authCtrl.isLoading.value
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                    Get.isDarkMode ? kmaincolor4 : kmaincolor,
                                  ))
                                : _buildSocialButton(
                                    "lib/core/assets/images/login_images/Guest.png",
                                    () => _showGuestLoginDialog(context),
                                    Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: Sizeconfig.screenheight! * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "no_account".tr,
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white70
                                    : Colors.black54),
                          ),
                          TextButton(
                            onPressed: () {
                              loginctrl.unfocuskeyboardlogin();
                              Get.offAll(() => SigninPage(),
                                  duration: const Duration(milliseconds: 500),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text(
                              "sign_in".tr,
                              style: TextStyle(
                                color:
                                    Get.isDarkMode ? kmaincolor4 : kmaincolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildSocialButton(
      String imagePath, VoidCallback onPressed, Color? color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        radius: 12,
        onTap: onPressed,
        child: Image.asset(
          fit: BoxFit.fill,
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}

// Add this new method to the LoginBody class
void _showGuestLoginDialog(BuildContext context) {
  final AnonymouslysignIn authnctrl = Get.find();

  Get.dialog(
    AlertDialog(
      title: Text(
        'guest_login_warning'.tr,
        style: TextStyle(
          color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'guest_login_message'.tr,
        style: TextStyle(
          color: Get.isDarkMode ? Colors.white70 : Colors.black87,
        ),
      ),
      backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'cancel'.tr,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white70 : Colors.grey[600],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            authnctrl.signInAnonymously();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'continue_guest'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
