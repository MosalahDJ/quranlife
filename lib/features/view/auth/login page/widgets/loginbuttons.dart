import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons(
      {super.key, required this.imageasset, this.text, required this.onpress});
  final String imageasset;
  final String? text;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(Colors.white.withValues(alpha: 0.5))),
      onPressed: onpress,
      child: Row(
        children: [
          SizedBox(height: 40, width: 40, child: Image.asset(imageasset)),
          Text(text == null ? "" : text!)
        ],
      ),
    );
  }
}
