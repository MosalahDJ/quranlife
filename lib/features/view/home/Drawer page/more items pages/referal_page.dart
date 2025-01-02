import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/auth/login%20page/widgets/loginbuttons.dart';
import 'package:get/get.dart';

class RefferalPage extends StatelessWidget {
  const RefferalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kmaincolor,
          title: Text(
            'referral_page'.tr,
            style: const TextStyle(color: Color(0xFFFFFFFF)),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(
              height: Sizeconfig.screenheight! / 3,
              width: Sizeconfig.screenwidth,
              child: Image.asset(
                "lib/core/assets/images/refferal_image/food.webp",
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: Sizeconfig.screenheight! / 60,
          ),
          Text(
            'share_app'.tr,
            style: TextStyle(
              color: kmaincolor,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 60,
          ),
          Text(
            'share_description'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 30,
          ),
          Text(
            'your_referral_link'.tr,
            style: TextStyle(
              color: kmaincolor,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFF000000),
                  )),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.copy)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFF000000),
                  ))),
              readOnly: true,
              initialValue: "https://www.google.com",
            ),
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 30,
          ),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  endIndent: 10,
                  height: 10,
                ),
              ),
              Text(
                'or_share_with'.tr,
                style: TextStyle(fontSize: 17, color: kmaincolor),
              ),
              const Expanded(
                child: Divider(
                  indent: 10,
                  height: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Sizeconfig.screenheight! / 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginButtons(
                onpress: () {},
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/Facebook.png",
              ),
              LoginButtons(
                onpress: () {},
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/Messenger.png",
              ),
              LoginButtons(
                onpress: () {},
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/X.png",
              ),
            ],
          ),
        ]));
  }
}
