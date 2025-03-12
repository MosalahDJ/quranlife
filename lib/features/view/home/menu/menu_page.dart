import 'package:flutter/material.dart';
import 'package:project/features/view/home/menu/menu_page_body.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
