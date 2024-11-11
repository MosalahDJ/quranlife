// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/view/auth/login%20page/loginpage.dart';
import 'package:quranlife/features/view/home/home_page.dart';

class SignInController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future signin(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: password.text,
      );
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      AwesomeDialog(
          dialogType: DialogType.success,
          dismissOnBackKeyPress: false,
          dismissOnTouchOutside: false,
          onDismissCallback: (type) {},
          context: context,
          title: "Email varification",
          body: const Text(
              "we sent an Email verification to your email, please verify your email first then click to Email verified"),
          btnOkText: "Email verified",
          btnOkOnPress: () {
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              Get.offAll(() => HomePage());
            } else {
              GetSnackBar(
                duration: const Duration(seconds: 10),
                backgroundColor: kmaincolor,
                snackPosition: SnackPosition.TOP,
                barBlur: 10,
                titleText: const Text(
                  "verify your email.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                messageText: const Text(
                  "please,verify your email first. So you can throuw in your acount ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ).show();
              Get.offAll(() => LoginPage());
            }
          }).show();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(
                context: context,
                title: "Error",
                body: const Text("The password provided is too weak."))
            .show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
                context: context,
                title: "Error",
                body: const Text(
                    "The account already exists for that email. go to Login Page"))
            .show();
      } else {
        AwesomeDialog(context: context, title: "Error", body: Text(e.code))
            .show();
      }
    }
  }

  bool visibility = false;
  visibilityfunc() {
    visibility = !visibility;
    update();
  }

  bool visibility2 = false;
  visibilityfunc2() {
    visibility2 = !visibility2;
    update();
  }

////
  FocusNode emailfnodesign = FocusNode();
  FocusNode passwordfnodesign = FocusNode();
  FocusNode passwordfnodesign2 = FocusNode();
  FocusNode namefnode = FocusNode();
  FocusNode numberfnode = FocusNode();

  unfocuskeyboardsignin() {
    emailfnodesign.unfocus();
    passwordfnodesign.unfocus();
    passwordfnodesign2.unfocus();
    namefnode.unfocus();
    numberfnode.unfocus();
  }

  @override
  void onClose() {
    super.onClose();
    emailcontroller.dispose();
    password.dispose();
  }
}
