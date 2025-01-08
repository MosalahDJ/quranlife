import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final MyHomeController homectrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 0,
        ),
        backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
        body: ListView(
          children: [
            // profile image

            GetBuilder<MyHomeController>(
              builder: (_) => Container(
                alignment: Alignment.center,
                width: Sizeconfig.screenwidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kmaincolor,
                      Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                                "lib/core/assets/images/background_image/islamic_patern_portrait.jpg"),
                            radius: 40,
                          ),

                          // cameara button in front of image

                          Positioned(
                            left: 40,
                            top: 40,
                            child: IconButton(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                constraints: const BoxConstraints(
                                    maxHeight: 30, maxWidth: 30),
                                iconSize: 15,
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(kmaincolor),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Sizeconfig.screenwidth! / 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "profile_name".tr, // Replace "Mohamed salah"
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "profile_email"
                                .tr, // Replace "mohamedsalah@gmail.com"
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
