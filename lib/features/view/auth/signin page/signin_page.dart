import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';
import 'package:project/features/controller/Auth%20controller/signncontroller.dart';

import 'package:project/features/view/auth/login%20page/loginpage.dart';
import 'package:project/features/view/auth/signin%20page/widgets/signin_body.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final SignInController signinctrl = Get.put<SignInController>(
    SignInController(),
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool shouldPop =
              await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('are_you_sure'.tr),
                      content: Text('leave_registration'.tr),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('no'.tr),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('yes'.tr),
                        ),
                      ],
                    ),
              ) ??
              false;

          if (shouldPop) {
            Get.offAllNamed("login");
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor,
          leading: IconButton(
            onPressed: () {
              signinctrl.unfocuskeyboardsignin();
              Get.offAll(
                () => LoginPage(),
                duration: const Duration(milliseconds: 500),
                transition: Transition.leftToRight,
              );
            },
            icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
          ),
          title: Text(
            "registration".tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SigneinPageBody(),
      ),
    );
  }
}
