// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveAnonymousUserDataToFirestore(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'isAnonymous': true,
      'displayName': 'Anonymous User',
      'email': 'email'.tr,
      'firstName': 'firstName'.tr,
      'lastName': 'lastName'.tr,
      'photoURL': 'photoURL'.tr,
      'gender': 'gender'.tr,
      'number': 'number'.tr,
      'password': 'password'.tr,
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      // Save anonymous user data to Firestore
      await _saveAnonymousUserDataToFirestore(userCredential.user!);
      print("تم تسجيل الدخول كمجهول: ${userCredential.user?.uid}");
      Get.offAllNamed("home");
      return userCredential.user;
    } catch (e) {
      print("خطأ أثناء تسجيل الدخول: $e");
      return null;
    }
  }
}
