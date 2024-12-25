import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/mycategory.dart';

class ServiceCategorie extends StatelessWidget {
  const ServiceCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Category", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: Sizeconfig.screenheight! / 100,
        ),
        ExpansionTile(
          trailing: MyCategory(
            ontap: () {},
            categoryicon: Icons.arrow_drop_down,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyCategory(
                ontap: () {},
                categoryicon: FlutterIslamicIcons.allah,
              ),
              MyCategory(
                ontap: () {},
                categoryicon: FlutterIslamicIcons.hadji,
              ),
              MyCategory(
                ontap: () {
                  Get.toNamed("hijri");
                },
                categoryicon: FlutterIslamicIcons.calendar,
              ),
              MyCategory(
                ontap: () {},
                categoryicon: FlutterIslamicIcons.community,
              ),
            ],
          ),
          children: [
            Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyCategory(
                      ontap: () {},
                      categoryicon: FlutterIslamicIcons.allah,
                    ),
                    MyCategory(
                      ontap: () {},
                      categoryicon: FlutterIslamicIcons.hadji,
                    ),
                    MyCategory(
                      ontap: () {
                        Get.toNamed("hijri");
                      },
                      categoryicon: FlutterIslamicIcons.calendar,
                    ),
                    MyCategory(
                      ontap: () {},
                      categoryicon: FlutterIslamicIcons.community,
                    ),
                    MyCategory(
                      ontap: () {},
                      categoryicon: FlutterIslamicIcons.family,
                    ),
                    MyCategory(
                      ontap: () {},
                      categoryicon: Icons.add,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
