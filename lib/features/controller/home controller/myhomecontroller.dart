import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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

  @override
  void onClose() {
    salawatPageController.dispose();
    super.onClose();
  }
}
