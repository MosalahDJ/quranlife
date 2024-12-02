import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/notfication%20controller/sub%20controllers/adhan_noti_controller.dart';

// final DeterminePrayersController dpcctrl = Get.find();
final AdhanNotiController adhanctrl = Get.find();

class Mytestpage extends StatelessWidget {
  const Mytestpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Test Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  adhanctrl.schedulePrayerNotification();
                },
                child: Text("scheduled"))
          ],
        ),
      ),
    );
  }
}
