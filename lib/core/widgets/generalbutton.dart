import 'package:flutter/material.dart';
import 'package:project/core/Utils/constants.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    super.key,
    required this.ontap,
    required this.buttontext,
  });
  final VoidCallback ontap;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: WidgetStatePropertyAll(kmaincolor4),
        elevation: const WidgetStatePropertyAll(15),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
        animationDuration: const Duration(seconds: 1),
        shadowColor: const WidgetStatePropertyAll(Colors.grey),
      ),
      child: Text(
        buttontext,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
