// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            "============================user signed out =============================");
      } else {
        print(
            "=========================user signed in in the app==================================== ");
      }
    });
  }

  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print("تم تسجيل الدخول كمجهول: ${userCredential.user?.uid}");
      Get.offAllNamed("home");
      return userCredential.user;
    } catch (e) {
      print("خطأ أثناء تسجيل الدخول: $e");
      return null;
    }
  }
}
