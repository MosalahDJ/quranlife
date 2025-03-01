// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final RxBool isLoading = false.obs;
  GlobalKey mykey = GlobalKey();

  Future login(BuildContext context) async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Get.offAllNamed("home");
      } else {
        AwesomeDialog(
                context: context,
                desc: 'verify_email_desc'.tr,
                title: 'verify_email_title'.tr)
            .show();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        AwesomeDialog(
                context: context,
                title: 'error'.tr,
                desc: 'wrong_credentials'.tr)
            .show();
      } else {
        AwesomeDialog(context: context, title: 'error'.tr, desc: e.code).show();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> signOut(BuildContext context) async {
    // Check internet connectivity first
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection, show dialog
      AwesomeDialog(
        context: context,
        title: 'no_internet'.tr,
        desc: 'internet_required_for_signout'.tr,
        dialogType: DialogType.warning,
      ).show();
      return;
    }
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        if (currentUser.isAnonymous) {
          // First delete the Firestore document
          try {
            await _firestore.collection('users').doc(currentUser.uid).delete();
          } catch (firestoreError) {
            debugPrint('Error deleting Firestore document: $firestoreError');
          }

          // Then delete anonymous user account
          await currentUser.delete();
        } else {
          // Sign out from Google if user signed in with Google
          final GoogleSignIn googleSignIn = GoogleSignIn();
          if (await googleSignIn.isSignedIn()) {
            await googleSignIn.signOut();
          }
        }

        // Sign out from Firebase
        await FirebaseAuth.instance.signOut();
      }

      // Navigate to login page
      Get.offAllNamed("login");
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(context: context, title: 'error'.tr, desc: e.code).show();
    }
  }

  bool visibility = true;
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
