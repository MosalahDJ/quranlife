// gradient background

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/size_config.dart';
import 'package:project/features/controller/home%20controller/myhomecontroller.dart';

class Gradientbackground extends StatelessWidget {
  const Gradientbackground({
    super.key,
    required this.gradientcolor,
    this.height,
  });
  final List<Color> gradientcolor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      height: height ?? Sizeconfig.screenheight! / 5,
      child: GetBuilder<MyHomeController>(
        builder:
            (_) => Container(
              height: Sizeconfig.screenheight! / 5,
              width: Sizeconfig.screenwidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientcolor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
      ),
    );
  }
}
