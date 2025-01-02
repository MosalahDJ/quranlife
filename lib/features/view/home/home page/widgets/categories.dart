import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/view/home/home%20page/widgets/mycategory.dart';

class ServiceCategorie extends StatelessWidget {
  ServiceCategorie({super.key});
  final ExpansionTileController expansionTileController =
      ExpansionTileController();
  final GlobalKey<State<StatefulWidget>> _expansionTileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: _expansionTileKey,
      controller: expansionTileController,
      trailing: MyCategory(
        ontap: () {
          expansionTileController.isExpanded
              ? expansionTileController.collapse()
              : expansionTileController.expand();
        },
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
    );
  }
}
