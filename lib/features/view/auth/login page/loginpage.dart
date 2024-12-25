import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Auth%20controller/passwordresset.dart';
import 'package:quranlife/features/controller/Auth%20controller/logincontroller.dart';
import 'package:quranlife/features/controller/Auth%20controller/textvalidatecontroller.dart';
import 'package:quranlife/features/view/auth/login%20page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LogInController loginctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();
  final PasswordresetController passreset = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool shouldPop = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content:
                      const Text('Do you want to leave the login process?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              ) ??
              false;
          if (shouldPop) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.offAllNamed("home");
                },
                icon: Icon(
                  Icons.gite_outlined,
                  color: Theme.of(context).iconTheme.color,
                ))
          ],
          title: Text(
            "Login",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor,
        ),
        body: LoginBody(),
      ),
    );
  }
}
