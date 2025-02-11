import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FadeAnimationController extends GetxController {
  final Rx<Key> rebuildKey = UniqueKey().obs;
  final Rx<Key> rebuildKey1 = UniqueKey().obs;
  final Rx<Key> rebuildKey2 = UniqueKey().obs;
  final Rx<Key> rebuildKey3 = UniqueKey().obs;
  final Rx<Key> rebuildKey4 = UniqueKey().obs;
  final Rx<Key> rebuildKey5 = UniqueKey().obs;
  final Rx<Key> rebuildKey6 = UniqueKey().obs;

  //pagecontroller
  PageController homepagecontroller = PageController();

  int? currentPage;

  @override
  void onInit() {
    super.onInit();
    currentPage = 0;
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
