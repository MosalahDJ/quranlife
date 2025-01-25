import 'package:flutter/material.dart';

class AyahSearch extends StatelessWidget {
  const AyahSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const SearchBar(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
