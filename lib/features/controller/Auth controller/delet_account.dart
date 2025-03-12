// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/features/controller/Auth%20controller/user_state_controller.dart';

class DeletAccount extends GetxController {
  final RxBool isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _userstatectrl = Get.put<UserStateController>(
    UserStateController(),
    permanent: true,
  );

  Future<void> deleteUserAccount(BuildContext context) async {
    try {
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

      // Get current user
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('no_user_logged_in'.tr);
      }

      // Show confirmation dialog
      bool confirmDelete = await Get.dialog(
        AlertDialog(
          title: Text('delete_account'.tr),
          content: Text('delete_account_confirmation'.tr),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: Text('cancel'.tr),
            ),
            ElevatedButton(
              onPressed: () => Get.back(result: true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('delete'.tr),
            ),
          ],
        ),
      );

      if (!confirmDelete) return;

      // Start loading state
      isLoading.value = true;

      // Delete user data from Firestore
      await _firestore.collection('users').doc(currentUser.uid).delete();

      // Delete user from Authentication
      await currentUser.delete();
      await _userstatectrl.saveUserState(UserState.noUser);

      // Show success message and navigate to login
      AwesomeDialog(
        context: context,
        title: 'success'.tr,
        desc: 'account_deleted_successfully'.tr,
        dialogType: DialogType.success,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        btnOkOnPress: () {
          Get.offAllNamed('login');
        },
      ).show();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'ERROR_SESSION_EXPIRED':
          errorMessage = 'please_login_again_to_delete'.tr;
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

  Future<void> anonymousSignout(BuildContext context) async {
    try {
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

      // Get current user
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('no_user_logged_in'.tr);
      }

      // Start loading state
      isLoading.value = true;

      // Delete user data from Firestore
      await _firestore.collection('users').doc(currentUser.uid).delete();

      // Delete user from Authentication
      await currentUser.delete();
      await _userstatectrl.saveUserState(UserState.noUser);

      Get.offAllNamed('login');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'ERROR_SESSION_EXPIRED':
          errorMessage = 'please_login_again_to_delete'.tr;
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

  // User logout function
  Future<void> signOut(BuildContext context) async {
    List<ConnectivityResult> conectivity =
        await Connectivity().checkConnectivity();
    if (conectivity.contains(ConnectivityResult.none)) {
      _showDialog(
        context,
        'no_internet'.tr,
        'internet_required_for_signout'.tr,
        DialogType.warning,
      );
      return;
    }

    try {
      isLoading.value = true;

      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        if (currentUser.isAnonymous) {
          await _firestore.collection('users').doc(currentUser.uid).delete();
          await currentUser.delete();
        } else {
          if (await GoogleSignIn().isSignedIn()) {
            await GoogleSignIn().signOut();
          }
        }
        await FirebaseAuth.instance.signOut();
        await _userstatectrl.saveUserState(UserState.noUser);
      }
      Get.offAllNamed("login");
    } on FirebaseAuthException catch (e) {
      _showDialog(
        context,
        'error'.tr,
        e.message ?? 'unknown_error'.tr,
        DialogType.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Show a dialog using AwesomeDialog
  void _showDialog(
    BuildContext context,
    String title,
    String desc,
    DialogType type,
  ) {
    AwesomeDialog(
      context: context,
      title: title,
      desc: desc,
      dialogType: type,
    ).show();
  }
}
