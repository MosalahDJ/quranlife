import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/widgets/more_items.dart';

class MyDrawer extends Drawer {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      width: Sizeconfig.screenwidth! / 1.19,
      backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
      child: Column(
        children: [
          SizedBox(
            height: Sizeconfig.screenheight! / 9,
          ),
          ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    "lib/core/assets/images/more_page_images/me.png"),
                maxRadius: 25,
              ),
              title: Text(
                "Mohamed Salah",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              subtitle: Text(
                "mohamedsalah@gmail.com",
                style: Theme.of(context).textTheme.labelSmall,
              )),
          SizedBox(
            height: Sizeconfig.screenheight! / 20,
          ),
          MoreItems(),
        ],
      ),
    );
  }
}
