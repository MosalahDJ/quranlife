import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/complain%20page/widgets/complain_form.dart';
import 'package:get/get.dart';

class ComplainContainer extends StatelessWidget {
  const ComplainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: kmaincolor,
          ),
          height: Sizeconfig.screenheight! / 12,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'how_can_we_help'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Icon(
                size: 30,
                Icons.face,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ComplainForm(
                titletext: 'name'.tr,
                maxlines: 1,
              ),
              ComplainForm(
                titletext: 'email'.tr,
                maxlines: 1,
              ),
              ComplainForm(
                titletext: 'description'.tr,
                maxlines: 5,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(10),
                      textStyle: const WidgetStatePropertyAll(
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      backgroundColor: WidgetStatePropertyAll(kmaincolor)),
                  onPressed: () {},
                  child: Text(
                    'send_message'.tr,
                    style: const TextStyle(color: Colors.white),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
