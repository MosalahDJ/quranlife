import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/complain%20page/widgets/complain_container.dart';

class ComplainPage extends StatelessWidget {
  const ComplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Us",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kmaincolor,
      ),
      backgroundColor: const Color.fromARGB(255, 154, 172, 139),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Row(
              children: [],
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 90,
            ),
            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 90,
            ),
            const Text(
              "We value your feedback. Please use the form below to send us your questions, concerns, or suggestions. We'll get back to you as soon as possible.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: Sizeconfig.screenheight! / 90,
            ),
            Center(
                child: Card(
              elevation: 10,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 212, 222, 205),
                ),
                height: Sizeconfig.screenheight! / 1.5,
                child: const ComplainContainer(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
