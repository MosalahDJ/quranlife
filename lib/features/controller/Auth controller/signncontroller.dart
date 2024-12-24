// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:quranlife/features/view/auth/login%20page/loginpage.dart';
import 'package:quranlife/features/view/home/home_page.dart';

class SignInController extends GetxController {
  final Txtvalcontroller txtvalctrl = Get.find();

  // Text Controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final TextEditingController number = TextEditingController();

  // Focus Nodes
  final FocusNode emailfnodesign = FocusNode();
  final FocusNode passwordfnodesign = FocusNode();
  final FocusNode passwordfnodesign2 = FocusNode();
  final FocusNode namefnode = FocusNode();
  final FocusNode numberfnode = FocusNode();

  // State variables
  bool isLoading = false;
  bool visibility = false;
  bool visibility2 = false;

  // Password visibility toggle functions
  void visibilityfunc() {
    visibility = !visibility;
    update();
  }

  void visibilityfunc2() {
    visibility2 = !visibility2;
    update();
  }

  // Keyboard focus management
  void unfocuskeyboardsignin() {
    emailfnodesign.unfocus();
    passwordfnodesign.unfocus();
    passwordfnodesign2.unfocus();
    namefnode.unfocus();
    numberfnode.unfocus();
  }

  // Sign in process
  Future<void> signin(BuildContext context) async {
    try {
      // Start loading state
      isLoading = true;
      update();

      // Create user account with Firebase
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: password.text,
      );

      // Send email verification
      await _sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(e, context);
    } finally {
      isLoading = false;
      update();
    }
  }

  // Helper method to send and handle email verification
  Future<void> _sendEmailVerification(BuildContext context) async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

    AwesomeDialog(
      dialogType: DialogType.success,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      context: context,
      title: "Email verification",
      body: const Text(
          "We sent an Email verification to your email. Please verify your email first then click 'Email verified'"),
      btnOkText: "Email verified",
      btnOkOnPress: () => _handleEmailVerificationResponse(),
    ).show();
  }

  // Handle email verification response
  void _handleEmailVerificationResponse() {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Get.offAll(() => HomePage());
    } else {
      _showVerificationRequiredMessage();
      Get.offAll(() => LoginPage());
    }
  }

  // Show verification required message
  void _showVerificationRequiredMessage() {
    GetSnackBar(
      duration: const Duration(seconds: 10),
      backgroundColor: kmaincolor,
      snackPosition: SnackPosition.TOP,
      barBlur: 10,
      titleText: const Text(
        "Verify your email",
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      messageText: const Text(
        "Please verify your email first to access your account",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ).show();
  }

  // Handle Firebase authentication errors
  void _handleFirebaseAuthError(FirebaseAuthException e, BuildContext context) {
    String errorMessage = switch (e.code) {
      'weak-password' => "The password provided is too weak.",
      'email-already-in-use' =>
        "An account already exists for this email. Please login instead.",
      _ => "Registration error: ${e.code}"
    };

    AwesomeDialog(
      context: context,
      title: "Error",
      body: Text(errorMessage),
    ).show();
  }

  // Clean up resources
  @override
  void onClose() {
    // Dispose controllers
    emailcontroller.dispose();
    password.dispose();
    password2.dispose();

    // Dispose focus nodes
    emailfnodesign.dispose();
    passwordfnodesign.dispose();
    passwordfnodesign2.dispose();
    namefnode.dispose();
    numberfnode.dispose();

    super.onClose();
  }
}
