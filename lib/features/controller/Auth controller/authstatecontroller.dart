// // ignore_for_file: avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AuthStateController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         print(
//             "============================user signed out =============================");
//       } else {
//         print(
//             "=========================user signed in in the app==================================== ");
//       }
//     });
//   }
// }
