import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.indposition,
    required this.dotscount,
    required this.dotscolor,
  });
  //this variable "indposition" will get the position from a parameter
  // whene this class called
  final int? indposition;
  final int dotscount;
  final Color dotscolor;
  //we use the get builder here for rebuilding the widget to change color

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHomeController>(
      builder:
          (c) => DotsIndicator(
            dotsCount: dotscount,
            decorator: DotsDecorator(
              activeColor: dotscolor,
              color: Colors.transparent,
              shape: CircleBorder(side: BorderSide(color: dotscolor)),
            ),
            position: indposition!,
          ),
    );
  }
}
