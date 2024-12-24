import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/about_us%20page/widget/social_media_contact.dart';

class WhoAmI extends StatelessWidget {
  const WhoAmI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: Sizeconfig.screenheight! / 10,
          width: Sizeconfig.screenwidth,
          color: const Color.fromARGB(255, 38, 198, 218),
          child: const Text(
            textAlign: TextAlign.center,
            "Who Am I?", // Fixed spacing before question mark
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        Container(
          height: Sizeconfig.screenheight! / 3,
          width: Sizeconfig.screenwidth,
          color: Colors.white,
          child: const Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                maxRadius: 60,
                backgroundImage: AssetImage(
                    "lib/core/assets/images/more_page_images/me.png"),
              ),
              Text(
                "Djehel Mohamed Salah",
                style: TextStyle(
                    color: Color.fromARGB(255, 38, 198, 218),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Mobile Application Developer", // Fixed "Developper" to "Developer"
                style: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          ),
        ),
        Container(
          height: 120,
          width: Sizeconfig.screenwidth,
          color: const Color.fromARGB(255, 38, 198, 218),
          child: const Row(
            children: [
              SocialMediaContact(
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/Facebook.png",
                socialeacount: "Djehel Mohamed Salah",
              ),
              VerticalDivider(
                thickness: 3,
                width: 3,
                color: Color.fromARGB(255, 66, 66, 66),
              ),
              SocialMediaContact(
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/Instagram.png",
                socialeacount: "moh.medsalah",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          height: 120,
          width: Sizeconfig.screenwidth,
          color: const Color.fromARGB(255, 38, 198, 218),
          child: const Row(
            children: [
              SocialMediaContact(
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/LinkedIn.png",
                socialeacount: "Djehel Mohamed Salah",
              ),
              VerticalDivider(
                width: 3,
                thickness: 3,
                color: Color.fromARGB(255, 66, 66, 66),
              ),
              SocialMediaContact(
                imageasset:
                    "lib/core/assets/images/login_images/login_button_image/X.png",
                socialeacount: "Djehel Mohamed Salah",
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 50,
          width: Sizeconfig.screenwidth,
        )
      ],
    );
  }
}
