import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/auth/login%20page/widgets/loginbuttons.dart';
import 'package:quranlife/features/view/auth/signin%20page/signin_page.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/googlelogincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';

class BottomLoginPage extends StatelessWidget {
  BottomLoginPage({super.key});
  final LogInController loginctrl = Get.find();
  final GoogleLogInController googlectrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();
  final PasswordresetController passreset = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SizedBox(
            height: Sizeconfig.screenheight! / 15,
            width: Sizeconfig.screenwidth! / 3,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kmaincolor4)),
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onPressed: () {
                if (txtvalctrl.loginemailstate.currentState!.validate() &&
                    txtvalctrl.loginpasswordstate.currentState!.validate()) {
                  loginctrl.unfocuskeyboardlogin();
                  loginctrl.login(context);
                }
              },
            ),
          ),
        ),
        SizedBox(
          height: Sizeconfig.screenheight! / 100,
        ),
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Color(0xFF3D3825),
                endIndent: 10,
                height: 10,
              ),
            ),
            Text(
              "Or login with:",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Expanded(
              child: Divider(
                color: Color(0xFF3D3825),
                indent: 10,
                height: 10,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Sizeconfig.screenheight! / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LoginButtons(
              onpress: () {
                loginctrl.unfocuskeyboardlogin();
              },
              imageasset:
                  "lib/core/assets/images/login_images/login_button_image/Facebook.png",
            ),
            LoginButtons(
              onpress: () async {
                loginctrl.unfocuskeyboardlogin();

                googlectrl.signInWithGoogle(context);
              },
              imageasset:
                  "lib/core/assets/images/login_images/login_button_image/google.png",
            ),
            LoginButtons(
              onpress: () {
                loginctrl.unfocuskeyboardlogin();
              },
              imageasset:
                  "lib/core/assets/images/login_images/login_button_image/X.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("you don't have an account?,"),
            TextButton(
                onPressed: () {
                  loginctrl.unfocuskeyboardlogin();

                  Get.offAll(() => SigninPage(),
                      duration: const Duration(milliseconds: 500),
                      transition: Transition.rightToLeft);
                },
                child: Text(
                  "sign in",
                  style: TextStyle(
                      color: Get.isDarkMode ? textcolordark : kmaincolor),
                ))
          ],
        )
      ],
    );
  }
}
