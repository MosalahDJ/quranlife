import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Auth%20controller/signncontroller.dart';
import 'package:quranlife/features/view/auth/login%20page/loginpage.dart';
import 'package:quranlife/features/view/auth/signin%20page/widgets/signin_body.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final SignInController signinctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor,
        leading: IconButton(
            onPressed: () {
              signinctrl.unfocuskeyboardsignin();

              Get.offAll(() => LoginPage(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.leftToRight);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        title: Text(
          "Signin",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SigneinPageBody(),
    );
  }
}
