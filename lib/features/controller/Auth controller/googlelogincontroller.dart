import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogInController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveUserDataToFirestore(UserCredential userCredential) async {
    final user = userCredential.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.email).set({
        'uid': user.uid,
        'displayName': user.displayName,
        'email': user.email,
        'firstName': 'firstName'.tr,
        'lastName': 'lastName'.tr,
        'photoURL': user.photoURL,
        'gender': 'gender'.tr,
        'number': 'number'.tr,
        'password': 'password'.tr,
        'lastLogin': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

  Future signInWithGoogle(context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(clientId: dotenv.env['GOOGLE_CLIENT_ID']).signIn();
      if (googleUser == null) {
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user data to Firestore
      await _saveUserDataToFirestore(userCredential);

      Get.offAllNamed("home");
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(context: context, body: Text("${e.message}")).show();
    } catch (e) {
      if (e ==
          "PlatformException(network_error, com.google.android.gms.common.api.ApiException: 7: , null, null)") {
        AwesomeDialog(context: context, body: Text("verify_internet".tr))
            .show();
      } else {
        AwesomeDialog(
                context: context, body: Text("${"google_signin_error".tr} :$e"))
            .show();
      }
    }
  }
}
