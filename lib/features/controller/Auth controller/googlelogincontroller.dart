import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogInController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxBool isLoading = false.obs;

  Future<void> _saveUserDataToFirestore(UserCredential userCredential) async {
    final user = userCredential.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'displayName': user.displayName,
        'email': user.email,
        'photoURL': user.photoURL,
        'lastLogin': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

  Future signInWithGoogle(context) async {
    try {
      isLoading.value = true;
      // Set default locale
      await FirebaseAuth.instance
          .setLanguageCode(Get.locale?.languageCode ?? 'en');

      // Configure Google Sign In with web client ID
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: dotenv.env['GOOGLE_CLIENT_ID'],
        scopes: ['email', 'profile'],
      );

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      // Add error handling for authentication
      try {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Save user data to Firestore
        await _saveUserDataToFirestore(userCredential);

        Get.offAllNamed("home");
      } catch (authError) {
        await googleSignIn.signOut(); // Clean up on auth error
        rethrow;
      }
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
              context: context,
              title: "Authentication Error",
              body: Text(e.message ?? "Authentication failed"),
              dialogType: DialogType.error)
          .show();
    } catch (e) {
      if (e.toString().contains("network_error")) {
        AwesomeDialog(
                context: context,
                title: "Network Error",
                body: Text("verify_internet".tr),
                dialogType: DialogType.error)
            .show();
      } else {
        AwesomeDialog(
                context: context,
                title: "Error",
                body: Text("google_signin_error".tr),
                dialogType: DialogType.error)
            .show();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
