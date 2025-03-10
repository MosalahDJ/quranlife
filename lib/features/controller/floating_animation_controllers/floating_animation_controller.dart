import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    animation = Tween<double>(
      begin: -7.0,
      end: 7.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
  }

  Widget buildFloatingWidget({
    required Widget child,
    bool withShadow = true,
    double? shadowWidth,
    double shadowHeight = 20,
    double shadowOpacity = 0.2,
    required double shadowOffset,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Column(
          children: [
            Transform.translate(
              offset: Offset(0, animation.value),
              child: child,
            ),
            if (withShadow)
              Transform.translate(
                offset: Offset(0, animation.value + shadowOffset),
                child: Container(
                  height: shadowHeight,
                  width: shadowWidth ?? Get.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: shadowOpacity),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
