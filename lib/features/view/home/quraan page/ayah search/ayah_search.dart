import 'package:flutter/material.dart';

class AyahSearch extends StatelessWidget {
  const AyahSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchBar(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
