import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';
import 'package:quranlife/features/view/home/menu/menu_page_body.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 0,
        ),
        body: MenuPageBody());
  }
}
