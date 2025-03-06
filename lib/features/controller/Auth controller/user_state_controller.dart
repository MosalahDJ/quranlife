import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserState {
  noUser,
  anonymousUser,
  emailSignInUser,
  googleSignInUser,
}

class UserStateController extends GetxController {
  Future<void> saveUserState(UserState userState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_state', userState.index);
  }

  Future<UserState> getUserState() async {
    final prefs = await SharedPreferences.getInstance();
    final userStateIndex = prefs.getInt('user_state') ?? UserState.noUser.index;
    return UserState.values[userStateIndex];
  }
}
