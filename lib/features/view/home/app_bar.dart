import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    super.key,
    required this.homectrl,
    required this.signoutctrl,
  });

  final MyHomeController homectrl;
  final GoogleSignoutController signoutctrl;

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: DrawerButton(
        color: Theme.of(context).iconTheme.color,
      ),
      actions: [
        IconButton(
            onPressed: homectrl.tosearchpage,
            icon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            )),
        IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await signoutctrl.googlesignout();
              Get.offAllNamed("login");
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            )),
      ],
      title: Text(
        "hey, User",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
