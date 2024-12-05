import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/view/auth/login%20page/widgets/bottom_login_page.dart';
import 'package:quranlife/core/widgets/information_form.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LogInController loginctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();
  final PasswordresetController passreset = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed("home");
              },
              icon: Icon(
                Icons.gite_outlined,
                color: Theme.of(context).iconTheme.color,
              ))
        ],
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Sizeconfig.screenheight! / 1.10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Sizeconfig.screenheight! / 100,
                    ),
                    SizedBox(
                      height: Sizeconfig.screenheight! / 4.2,
                      width: Sizeconfig.screenwidth,
                      child: Image.asset(
                          "lib/core/assets/images/app_logo/pnglogo.png"),
                    ),
                    Center(
                      child: Text(
                        "Quraan Life",
                        style: TextStyle(
                            color: Get.isDarkMode
                                ? const Color(0xFFE5AB57)
                                : const Color(0xFF3D3825),
                            fontSize: 35),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Form(
                      key: txtvalctrl.loginemailstate,
                      child: InformationsForm(
                        focusnode: loginctrl.emailfnodelog,
                        keyboardtype: TextInputType.emailAddress,
                        validator: (val) {
                          return val == "" ? "cant be empty" : null;
                        },
                        isrequired: true,
                        textctrl: loginctrl.emailcontroller,
                        formtitle: "Email",
                        hint: "enter your email address",
                      ),
                    ),
                    SizedBox(
                      height: Sizeconfig.screenheight! / 50,
                    ),
                    Form(
                      key: txtvalctrl.loginpasswordstate,
                      child: GetBuilder<LogInController>(
                        builder: (controller) {
                          return InformationsForm(
                            focusnode: loginctrl.passwordfnodelog,
                            suffixbutton: IconButton(
                                onPressed: loginctrl.visibilityfunc,
                                icon: Icon(
                                  loginctrl.visibility
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF3D3825),
                                )),
                            lines: 1,
                            obsecure: loginctrl.visibility,
                            validator: (val) {
                              return val == "" ? "cant be empty" : null;
                            },
                            isrequired: true,
                            textctrl: loginctrl.passwordcontroller,
                            formtitle: "Password",
                            hint: "enter your password",
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          loginctrl.unfocuskeyboardlogin();
                          passreset.resetpassword(context);
                        },
                        child: Text(
                          "forgot password?",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
                BottomLoginPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
