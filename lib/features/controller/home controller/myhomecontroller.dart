import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyHomeController extends GetxController {
  int selected = 2;

  //bnbfunc
  bnbfunc(int val) {
    selected = val;
    update();
  }

  //searchpage
  tosearchpage() {
    Get.toNamed("search");
  }

  //focus node
  FocusNode searchfnode = FocusNode();

  unfocuskeyboardhome() {
    searchfnode.unfocus();
  }

  //pagecontroller
  PageController homepagecontroller = PageController();

  int? currentPage;
  @override
  void onInit() {
    super.onInit();
    //w made the page controller here on init state for lunching whene the page
    //open and we add a listener to it let it value change if we change the page
    //also we use the update for refreshing the ui if the value change
    homepagecontroller.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        currentPage = homepagecontroller.page!.toInt();
        update();
      });
    });
  }

  @override
  void onClose() {
    homepagecontroller.dispose();
    super.onClose();
  }
}
