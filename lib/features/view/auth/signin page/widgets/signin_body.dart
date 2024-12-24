import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/generalbutton.dart';
import 'package:quranlife/core/widgets/information_form.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';

/// A stateless widget that handles user registration form with validation
/// Includes fields for name, phone, email, and password with confirmation
class SigneinPageBody extends StatelessWidget {
  SigneinPageBody({super.key});

  // Controllers for sign-in and validation logic
  final SignInController signinctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // App branding section
            Column(
              children: [
                SizedBox(
                  height: Sizeconfig.screenheight! / 100,
                ),
                SizedBox(
                  height: Sizeconfig.screenheight! / 6,
                  width: Sizeconfig.screenwidth!,
                  child: Image.asset(
                    "lib/core/assets/images/app_logo/pnglogo.png",
                  ),
                ),
                Center(
                  child: Text(
                    "Quraan Life",
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? const Color(0xFFE5AB57)
                            : const Color(0xFF3D3825),
                        fontSize: 30),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            // Registration form fields
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: txtvalctrl.signinnamestate,
              child: InformationsForm(
                textctrl: signinctrl.name,
                focusnode: signinctrl.namefnode,
                formtitle: "Name", // Capitalized
                hint: "Enter your name",
                keyboardtype: TextInputType.name,
                obsecure: false,
                isrequired: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Name is required';
                  }
                  if (val.length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: txtvalctrl.signinphonestate,
              child: InformationsForm(
                textctrl: signinctrl.number,
                focusnode: signinctrl.numberfnode,
                isrequired: true,
                formtitle: "Phone Number", // Changed from "number"
                hint: "Enter your phone number",
                keyboardtype: TextInputType.number,
                obsecure: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Phone number is required';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(val)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: txtvalctrl.signinemailstate,
              child: InformationsForm(
                focusnode: signinctrl.emailfnodesign,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Email is required';
                  }
                  if (!GetUtils.isEmail(val)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                isrequired: true,
                textctrl: signinctrl.emailcontroller,
                formtitle: "Email",
                hint: "Enter your email", // Lowercase "email"
                keyboardtype: TextInputType.emailAddress,
                obsecure: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Password fields with visibility toggles
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: txtvalctrl.signinpasswordstate,
              child: InformationsForm(
                focusnode: signinctrl.passwordfnodesign,
                lines: 1,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Password is required';
                  }
                  if (val.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                suffixbutton: GetBuilder<SignInController>(
                  builder: (c) => IconButton(
                      onPressed: signinctrl.visibilityfunc,
                      icon: Icon(
                        signinctrl.visibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Get.isDarkMode
                            ? Colors.white
                            : const Color(0xFF3D3825),
                      )),
                ),
                isrequired: true,
                textctrl: signinctrl.password,
                formtitle: "Password",
                hint: "Enter your password", // Lowercase "password"
                keyboardtype: TextInputType.emailAddress,
                obsecure: signinctrl.visibility,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: txtvalctrl.signinpasswordstate2,
              child: InformationsForm(
                focusnode: signinctrl.passwordfnodesign2,
                lines: 1,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (val != signinctrl.password.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                formtitle: "Password",
                hint: "Enter your password", // Lowercase "password"
                keyboardtype: TextInputType.emailAddress,
                obsecure: signinctrl.visibility2,
                suffixbutton: GetBuilder<SignInController>(
                  builder: (c) => IconButton(
                      onPressed: signinctrl.visibilityfunc2,
                      icon: Icon(
                        signinctrl.visibility2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Get.isDarkMode
                            ? Colors.white
                            : const Color(0xFF3D3825),
                      )),
                ),
                isrequired: true,
                textctrl: signinctrl.password2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Submit button with form validation
            SizedBox(
              height: Sizeconfig.screenheight! / 15,
              width: Sizeconfig.screenwidth! / 3,
              child: GetBuilder<SignInController>(
                builder: (controller) => controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Get.isDarkMode ? kmaincolor4 : kmaincolor3dark,
                      ))
                    : GeneralButton(
                        buttontext: "Submit", // Capitalized
                        ontap: () {
                          signinctrl.unfocuskeyboardsignin();

                          // Validate all forms
                          bool isValid = txtvalctrl
                                  .signinnamestate.currentState!
                                  .validate() &&
                              txtvalctrl.signinphonestate.currentState!
                                  .validate() &&
                              txtvalctrl.signinemailstate.currentState!
                                  .validate() &&
                              txtvalctrl.signinpasswordstate.currentState!
                                  .validate() &&
                              txtvalctrl.signinpasswordstate2.currentState!
                                  .validate();

                          if (isValid) {
                            signinctrl.signin(context);
                          }
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
