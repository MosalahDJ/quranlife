import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/get_response_body.dart';

// final DeterminePrayersController dpcctrl = Get.find();
final GetResponseBody rbctrl = Get.find();

class Mytestpage extends StatelessWidget {
  const Mytestpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.toNamed("home");
            },
            icon: const Icon(Icons.home)),
        title: const Text("My Test Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    rbctrl.gettingresponse();
                  },
                  child: const Text("scheduled")),
              Text("text: ${rbctrl.responsebody}"),
            ],
          ),
        ),
      ),
    );
  }
}
