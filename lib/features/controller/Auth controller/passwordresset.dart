import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';

class PasswordresetController extends GetxController {
  final LogInController loginctrl = Get.find();

  resetpassword(context) async {
    try {
      if (loginctrl.emailcontroller.text == "") {
        GetSnackBar(
          duration: const Duration(seconds: 10),
          backgroundColor: kmaincolor,
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          borderRadius: 20,
          barBlur: 10,
          titleText: const Text(
            "Invalid Email",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          messageText: const Text(
            "please add your email first",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ).show();
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: loginctrl.emailcontroller.text);
        AwesomeDialog(
          context: context,
          alignment: Alignment.center,
          animType: AnimType.scale,
          title: "Password Reset",
          // desc: "Password Reset",
          dialogType: DialogType.success,
          body: Text(
            "we sent a reset password link to ${loginctrl.emailcontroller.text}",
            textAlign: TextAlign.center,
          ),
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(context: context, title: "Eorror", body: Text(e.message!));
    }
  }
}
