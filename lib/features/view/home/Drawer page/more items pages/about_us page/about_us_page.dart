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
          "About us",
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
                        "'We Can Build your future Mobile APP of ",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 40),
                      ),
                      const Text(
                        "both android and apple OS'",
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
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure .",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                      ),
                      SizedBox(
                        height: Sizeconfig.screenheight! / 70,
                      ),
                      const Text(
                        "dolor in reprehenderit  in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum .",
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
