import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/generalbutton.dart';
import 'package:quranlife/core/widgets/information_form.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';

class SigneinPageBody extends StatelessWidget {
  SigneinPageBody({super.key});

  final SignInController signinctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
            InformationsForm(
              focusnode: signinctrl.namefnode,
              formtitle: "name",
              hint: "Enter your name",
              keyboardtype: TextInputType.name,
              obsecure: false,
            ),
            const SizedBox(
              height: 10,
            ),
            InformationsForm(
              focusnode: signinctrl.numberfnode,
              formtitle: "number",
              hint: "Enter your phone number",
              keyboardtype: TextInputType.number,
              obsecure: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: txtvalctrl.signinemailstate,
              child: InformationsForm(
                focusnode: signinctrl.emailfnodesign,
                validator: (val) {
                  return val == "" ? "cant ba empty" : null;
                },
                isrequired: true,
                textctrl: signinctrl.emailcontroller,
                formtitle: "Email",
                hint: "Enter your Email",
                keyboardtype: TextInputType.emailAddress,
                obsecure: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: txtvalctrl.signinpasswordstate,
              child: InformationsForm(
                focusnode: signinctrl.passwordfnodesign,
                lines: 1,
                validator: (val) {
                  return val == "" ? "cant ba empty" : null;
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
                hint: "Enter your Password",
                keyboardtype: TextInputType.emailAddress,
                obsecure: signinctrl.visibility,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InformationsForm(
              focusnode: signinctrl.passwordfnodesign2,
              lines: 1,
              formtitle: "Password",
              hint: "Enter your Password",
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
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 15,
              width: Sizeconfig.screenwidth! / 3,
              child: GeneralButton(
                buttontext: "submit",
                ontap: () {
                  signinctrl.unfocuskeyboardsignin();

                  if (txtvalctrl.signinemailstate.currentState!.validate() &&
                      txtvalctrl.signinpasswordstate.currentState!.validate()) {
                    signinctrl.signin(context);
                  }
                },
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
