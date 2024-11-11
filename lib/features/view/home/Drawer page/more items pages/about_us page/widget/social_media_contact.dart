import 'package:flutter/material.dart';

class SocialMediaContact extends StatelessWidget {
  const SocialMediaContact(
      {super.key, required this.imageasset, required this.socialeacount});

  final String imageasset;
  final String socialeacount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FilledButton(
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
        ),
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(
                imageasset,
              ),
            ),
            Text(
              socialeacount,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
