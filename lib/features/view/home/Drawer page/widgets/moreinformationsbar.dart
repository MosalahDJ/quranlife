import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';

class Moreinformations extends StatelessWidget {
  const Moreinformations(
      {super.key,
      required this.icondata,
      required this.textdata,
      required this.onpressed});
  final IconData icondata;
  final String textdata;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenheight! / 16,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: onpressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icondata,
                  color: Get.isDarkMode ? textcolor3dark : kmaincolor,
                ),
                SizedBox(
                  width: Sizeconfig.screenwidth! / 25,
                ),
                Text(
                  textdata,
                  style: TextStyle(
                    fontSize: 15,
                    color: Get.isDarkMode
                        ? textcolor3dark
                        : const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Get.isDarkMode
                      ? textcolor3dark
                      : const Color.fromRGBO(0, 0, 0, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
