// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  GlobalKey mykey = GlobalKey();

  Future login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Get.offAllNamed("home");
      } else {
        AwesomeDialog(
                context: context,
                desc: "you need to verify your email first.!",
                title: "verify your email ")
            .show();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        AwesomeDialog(
                context: context,
                title: "Error",
                desc: "password or email is wrong")
            .show();
      } else {
        AwesomeDialog(context: context, title: "Error", desc: e.code).show();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  bool visibility = false;
  visibilityfunc() {
    visibility = !visibility;
    update();
  }

  FocusNode emailfnodelog = FocusNode();
  FocusNode passwordfnodelog = FocusNode();

  unfocuskeyboardlogin() {
    emailfnodelog.unfocus();
    passwordfnodelog.unfocus();
  }

  @override
  void onClose() {
    super.onClose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
}
