// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';
import 'package:project/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:project/features/controller/Auth%20controller/user_state_controller.dart';
import 'package:project/features/view/auth/login%20page/loginpage.dart';
import 'package:project/features/view/home/main_page.dart';

class SignInController extends GetxController {
  final Txtvalcontroller txtvalctrl = Get.put<Txtvalcontroller>(
    Txtvalcontroller(),
  );

  final _userstatectrl = Get.put<UserStateController>(
    UserStateController(),
    permanent: true,
  );

  // Text Controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final TextEditingController gendre = TextEditingController();

  // Focus Nodes
  final FocusNode emailfnodesign = FocusNode();
  final FocusNode passwordfnodesign = FocusNode();
  final FocusNode passwordfnodesign2 = FocusNode();
  final FocusNode namefnode = FocusNode();
  final FocusNode lastnamefnode = FocusNode();
  final FocusNode gendrefnode = FocusNode();

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
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _saveUserDataToFirestore(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'displayName': '${name.text} ${lastname.text}',
      'firstName': name.text,
      'lastName': lastname.text,
      'photoURL': user.photoURL,
      'gendre': gendre.text,
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> signin(BuildContext context) async {
    try {
      isLoading = true;
      update();
      await _createNewAccount(context);
    } catch (e) {
      debugPrint('Error in signin: $e');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'error'.tr,
        body: Text('registration_error'.tr),
      ).show();
    } finally {
      isLoading = false;
      update();
    }
  }

  // New method to handle account creation
  Future<void> _createNewAccount(BuildContext context) async {
    try {
      // Create user account with Firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailcontroller.text,
            password: password.text,
          );
      await userCredential.user!.updateDisplayName(
        '${name.text} ${lastname.text}',
      );

      // Save user data to Firestore
      await _saveUserDataToFirestore(userCredential.user!);
      await _userstatectrl.saveUserState(UserState.emailSignInUser);

      // Send email verification
      await _sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(e, context);
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
      title: 'email_verification'.tr,
      body: Text('verification_sent'.tr),
      btnOkText: 'email_verified'.tr,
      btnOkOnPress: () => _handleEmailVerificationResponse(),
    ).show();
  }

  // Handle email verification response
  void _handleEmailVerificationResponse() {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Get.offAll(() => MainPage());
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
      titleText: Text(
        'verify_email'.tr,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      messageText: Text(
        'verify_email_message'.tr,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
    ).show();
  }

  // Handle Firebase authentication errors
  void _handleFirebaseAuthError(FirebaseAuthException e, BuildContext context) {
    String errorMessage = switch (e.code) {
      'weak-password' => 'weak_password'.tr,
      'email-already-in-use' => 'email_exists'.tr,
      _ => "${'registration_error'.tr}: \n${e.code}",
    };
    AwesomeDialog(
      context: context,
      title: 'error'.tr,
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

    super.onClose();
  }
}
