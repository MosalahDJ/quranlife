import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';

class PasswordresetController extends GetxController {
  final LogInController loginctrl = Get.find();

  resetpassword(context, emailtext) async {
    try {
      if (emailtext == "") {
        GetSnackBar(
          duration: const Duration(seconds: 10),
          backgroundColor: kmaincolor,
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          borderRadius: 20,
          barBlur: 10,
          titleText: Text(
            'invalid_email_title'.tr,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          messageText: Text(
            'enter_email_first'.tr,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ).show();
      } else {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailtext);
        AwesomeDialog(
          context: context,
          alignment: Alignment.center,
          animType: AnimType.scale,
          title: 'password_reset'.tr,
          // desc: "Password Reset",
          dialogType: DialogType.success,
          body: Text(
            "${'reset_link_sent'.tr} $emailtext",
            textAlign: TextAlign.center,
          ),
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
          context: context, title: 'error'.tr, body: Text(e.message!));
    }
  }
}
