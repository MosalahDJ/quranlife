import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/features/controller/Url%20Luncher%20Controller/url_luncher_controller.dart';

class MyHomeController extends GetxController {
  int selected = 2;

  //bnbfunc
  bnbfunc(int val) {
    selected = val;
    update();
  }

  //focus node
  FocusNode searchfnode = FocusNode();

  unfocuskeyboardhome() {
    searchfnode.unfocus();
  }

  //pagecontroller
  PageController salawatPageController = PageController();

  final RxInt salawatPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    salawatPageController.addListener(() {
      if (salawatPageController.hasClients) {
        salawatPage.value = salawatPageController.page?.toInt() ?? 0;
      }
    });
  }

  void showShareDialog(BuildContext context) {
  final UrlLuncherAndSharingController urllunchctrl = Get.find();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('share_app'.tr),
        content: Text('share_app_message'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              urllunchctrl.shareWithAnyApp();
            },
            style: TextButton.styleFrom(
              foregroundColor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
            ),
            child: Text('share'.tr),
          ),
        ],
      );
    },
  );
}

  @override
  void onClose() {
    salawatPageController.dispose();
    super.onClose();
  }
}
