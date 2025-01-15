import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/Auth%20controller/signoutcontroller.dart';
import 'package:quranlife/features/controller/home%20controller/myhomecontroller.dart';

class DuaaPage extends StatelessWidget {
  DuaaPage({super.key});

  final MyHomeController homectrl = Get.find();
  final GoogleSignoutController signoutctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // duaa listview
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Sizeconfig.screenheight! / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //duaa container

                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10))),
                        ),
                      ),

                      //counter button

                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: const WidgetStatePropertyAll(0),
                              backgroundColor:
                                  WidgetStatePropertyAll(kmaincolor),
                              shape: const WidgetStatePropertyAll(
                                ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},

                            //counter text

                            child: Text(
                              "count".tr,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
