import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/about_us%20page/about_us_page.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/complain%20page/complain_page.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/referal_page.dart';
import 'package:quranlife/features/view/home/Drawer%20page/widgets/moreinformationsbar.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';

class MoreItems extends StatelessWidget {
  MoreItems({super.key});

  final GoogleSignoutController signoutctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Moreinformations(
          onpressed: () {
            Get.toNamed("history");
          },
          icondata: Icons.history,
          textdata: "History",
        ),
        Moreinformations(
          onpressed: () {
            Get.to(() => const ComplainPage());
          },
          icondata: Icons.message_rounded,
          textdata: "Complain",
        ),
        Moreinformations(
          onpressed: () {
            Get.to(() => const RefferalPage());
          },
          icondata: Icons.share_outlined,
          textdata: "Referral",
        ),
        Moreinformations(
          onpressed: () {
            Get.to(() => const AboutUsPage());
          },
          icondata: Icons.account_box_outlined,
          textdata: "About Us",
        ),
        Moreinformations(
          onpressed: () {
            Get.toNamed("settings");
          },
          icondata: Icons.settings,
          textdata: "Settings",
        ),
        Moreinformations(
          onpressed: () async {
            await FirebaseAuth.instance.signOut();
            await signoutctrl.googlesignout();
            Get.offAllNamed("login");
          },
          icondata: Icons.logout_outlined,
          textdata: "Logout",
        ),
      ],
    );
  }
}
