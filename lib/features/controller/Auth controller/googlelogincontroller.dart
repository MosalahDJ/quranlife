import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogInController extends GetxController {
  Future signInWithGoogle(context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId:
                  '667982982906-053ns9m2ua3qv8h2noq5434123sas0j7.apps.googleusercontent.com')
          .signIn();
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
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed("home");
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(context: context, body: Text("${e.message}")).show();
    } catch (e) {
      if (e ==
          "PlatformException(network_error, com.google.android.gms.common.api.ApiException: 7: , null, null)") {
        AwesomeDialog(
                context: context,
                body: Text("verify_internet".tr))
            .show();
      } else {
        AwesomeDialog(context: context, body: Text("${"google_signin_error".tr} :$e")).show();
      }
    }
  }
}
