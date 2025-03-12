// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project/features/controller/Auth%20controller/user_state_controller.dart';

class AnonymouslysignIn extends GetxController {
  final RxBool isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _userstatectrl =
      Get.put<UserStateController>(UserStateController(), permanent: true);

  Future<void> _saveAnonymousUserDataToFirestore(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'isAnonymous': true,
      'displayName': 'anonymous_user',
      'email': 'no_email',
      'firstName': 'firstName',
      'lastName': 'lastName',
      'photoURL': 'photoURL',
      'gender': 'gender',
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<User?> signInAnonymously() async {
    try {
      isLoading.value = true;
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      // Save anonymous user data to Firestore
      await _saveAnonymousUserDataToFirestore(userCredential.user!);
      await _userstatectrl.saveUserState(UserState.anonymousUser);
      Get.offAllNamed("home");
      return userCredential.user;
    } catch (e) {
      print("خطأ أثناء تسجيل الدخول: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
