import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/Drawer%20page/more%20items%20pages/about_us%20page/widget/who_am_i.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us", // Capitalized "Us"
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: const Color(0xFF424242),
      ),
      backgroundColor: const Color(0xFF9E9E9E).withOpacity(0.5),
      body: ListView(children: [
        Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(
                  height: Sizeconfig.screenheight! / 2.2,
                  width: Sizeconfig.screenwidth,
                  child: Image.asset(
                      fit: BoxFit.fill,
                      "lib/core/assets/images/background_image/background_image.jpg"),
                ),
                Container(
                  height: Sizeconfig.screenheight! / 2.35,
                  color: const Color(0xFF424242),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E2E).withOpacity(0.9),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Container(
                      height: Sizeconfig.screenheight! / 18,
                      width: Sizeconfig.screenwidth! / 8,
                      color: const Color(0xFFEF6C00),
                      child: InkWell(
                        overlayColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 224, 224, 224)),
                        onTap: () {},
                        child: const Icon(
                          Icons.add_call,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xFFEF6C00),
                          size: 40,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: Sizeconfig.screenheight! / 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 30, left: 50),
                  child: Column(
                    children: [
                      const Text(
                        "'We Can Build Your Future Mobile App for", // Fixed capitalization and preposition
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 40),
                      ),
                      const Text(
                        "Both Android and iOS'", // Fixed capitalization and OS names
                        style: TextStyle(
                            color: Color(0xFF26C6DA),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Sizeconfig.screenheight! / 25,
                      ),
                      Divider(
                        endIndent: Sizeconfig.screenwidth! / 2,
                        height: 10,
                      ),
                      SizedBox(
                        height: Sizeconfig.screenheight! / 25,
                      ),
                      const Text(
                        "We specialize in mobile app development, creating innovative solutions for both personal and business needs. Our team of experienced developers ensures high-quality, user-friendly applications that meet modern standards and requirements.", // Replaced Lorem ipsum with relevant content
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                      ),
                      SizedBox(
                        height: Sizeconfig.screenheight! / 70,
                      ),
                      const Text(
                        "With a focus on performance and user experience, we deliver cutting-edge mobile applications that help our clients achieve their goals and stay ahead in the digital world.", // Replaced Lorem ipsum with relevant content
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                      )
                    ],
                  ))
            ],
          )
        ]),
        const WhoAmI(),
      ]),
    );
  }
}
