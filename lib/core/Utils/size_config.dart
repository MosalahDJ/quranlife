import 'package:flutter/material.dart';

class Sizeconfig {
  static double? screenheight;
  static double? screenwidth;
  Orientation? orientation;

  void init(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
  }
}
