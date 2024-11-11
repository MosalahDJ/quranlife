import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Salattimebar extends StatelessWidget {
  const Salattimebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: ListTile(
        titleTextStyle: const TextStyle(),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "مواقيت الصلاة",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        trailing: const Icon(
          Icons.settings_applications_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
