import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/complain%20page/widgets/complain_form.dart';

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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "How can we help you  ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Icon(
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
              const ComplainForm(
                titletext: "name",
                maxlines: 1,
              ),
              const ComplainForm(
                titletext: "email",
                maxlines: 1,
              ),
              const ComplainForm(
                titletext: "description",
                maxlines: 5,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(10),
                      textStyle: const WidgetStatePropertyAll(TextStyle(
                          fontFamily: "Poppins-Black",
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                      backgroundColor: WidgetStatePropertyAll(kmaincolor)),
                  onPressed: () {},
                  child: const Text(
                    "send complain",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
