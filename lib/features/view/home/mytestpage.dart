import 'package:flutter/material.dart';
import 'package:quranlife/features/controller/notfication%20controller/notification_controller.dart';

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
                  NotificationController.showsimplenotification(
                      title: "simple notification",
                      body: "mysimplebody",
                      pyload: "this is simple data");
                },
                child: const Text("show simple notification")),
            ElevatedButton(
                onPressed: () {
                  NotificationController.showperiodicnotification(
                      title: "periodic notification",
                      body: "myperiodicebody",
                      pyload: "this is periodic data");
                },
                child: const Text("request permission notification")),
            ElevatedButton(
                onPressed: () {
                  NotificationController.requestNotificationPermissions();
                },
                child: const Text("show periodic notification")),
          ],
        ),
      ),
    );
  }
}
