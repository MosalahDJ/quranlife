import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class AyahViewPage extends StatelessWidget {
  AyahViewPage({
    required this.backround,
    super.key,
  });

  final Widget backround;

  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //gradient background

      backround,

      //front of page

      Positioned(
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),

            //gridviewbuilder
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Form(
                    child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 229, 240, 219),
                  focusNode: homectrl.searchfnode,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 229, 240, 219),
                      fontSize: 15,
                      fontFamily: "Poppins-Black"),
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Search verses...",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 219, 239, 201),
                          fontSize: 15)),
                )),
                SizedBox(
                  height: Sizeconfig.screenheight! / 40,
                ),
                SizedBox(
                  height: Sizeconfig.screenheight! / 1.6,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => const Text("data"),
                  ),
                )
              ],
            )),
      ),
    ]);
  }
}
