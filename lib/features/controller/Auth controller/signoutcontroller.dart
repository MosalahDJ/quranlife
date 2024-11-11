import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignoutController extends GetxController {
  GoogleSignIn googlesignin = GoogleSignIn();

  Future googlesignout() async {
    await googlesignin.signOut();
  }
}
