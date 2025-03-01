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

  Future<void> updateUserProfile({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required bool isMale,
  }) async {
    try {
      // Validate required fields
      if (firstName.trim().isEmpty ||
          lastName.trim().isEmpty ||
          email.trim().isEmpty) {
        AwesomeDialog(
          context: context,
          title: 'error'.tr,
          desc: 'all_fields_required'.tr,
          dialogType: DialogType.error,
        ).show();
        return;
      }

      // Validate email format
      if (!GetUtils.isEmail(email)) {
        AwesomeDialog(
          context: context,
          title: 'error'.tr,
          desc: 'invalid_email'.tr,
          dialogType: DialogType.error,
        ).show();
        return;
      }

      // Check if user is logged in
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      // Check internet connectivity
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        AwesomeDialog(
          context: context,
          title: 'no_internet'.tr,
          desc: 'check_internet_connection'.tr,
          dialogType: DialogType.error,
        ).show();
        return;
      }

      // Start loading state
      isLoading.value = true;
      // Update email if changed
      if (email != currentUser.email) {
        await currentUser.verifyBeforeUpdateEmail(email);
        // Note: This will send a verification email to the new address
        // The email won't be updated until the user verifies it
        AwesomeDialog(
          context: context,
          title: 'verify_email'.tr,
          desc: 'verify_new_email_sent'.tr,
          dialogType: DialogType.info,
        ).show();
      }

      // Update user profile in Firestore
      await _firestore.collection('users').doc(currentUser.uid).update({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'gender': isMale ? 'male' : 'female',
        'updatedAt': FieldValue.serverTimestamp(),
        'uid': currentUser.uid,
        'displayName': '$firstName $lastName',
        'createdAt': FieldValue.serverTimestamp(),
        'lastLogin': FieldValue.serverTimestamp(),
      });

      // Show success message
      AwesomeDialog(
        context: context,
        title: 'success'.tr,
        desc: 'profile_updated_successfully'.tr,
        dialogType: DialogType.success,
      ).show();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'requires-recent-login':
          errorMessage = 'please_login_again'.tr;
          break;
        case 'email-already-in-use':
          errorMessage = 'email_already_exists'.tr;
          break;
        default:
          errorMessage = e.message ?? 'unknown_error'.tr;
      }

      AwesomeDialog(
        context: context,
        title: 'error'.tr,
        desc: errorMessage,
        dialogType: DialogType.error,
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error'.tr,
        desc: 'unknown_error'.tr,
        dialogType: DialogType.error,
      ).show();
    } finally {
      isLoading.value = false;
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
