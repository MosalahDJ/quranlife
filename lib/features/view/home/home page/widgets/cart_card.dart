import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/location_controller.dart';

class CartCard extends StatelessWidget {
  CartCard({super.key, required this.color, required this.elevation});

  final Color color;
  final double elevation;

  final LocationController locationctrl = Get.find();
  final FetchPrayerFromDate fpfctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //making stack widget responsive
      height: Sizeconfig.screenheight! < 768
          ? Sizeconfig.screenheight! / 3.7
          : Sizeconfig.screenheight! > 1024
              ? Sizeconfig.screenheight! / 5
              : Sizeconfig.screenheight! / 4.5,
      child: Stack(
        children: [
          //card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 150,
            child: Card(
              elevation: 2,
              color: color,
              child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                                "you are new here? \nand you want to find a mosque?\ndon't wory we can find nearest mosque to your place. ")
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: Column())
                    ],
                  )),
            ),
          ),
          //masjid png image
          Positioned(
            right: Sizeconfig.screenwidth! / 40,
            left: Sizeconfig.screenwidth! / 2,
            bottom: Sizeconfig.screenheight! < 768
                ? Sizeconfig.screenheight! / 20
                : Sizeconfig.screenheight! > 1010
                    ? Sizeconfig.screenheight! / 250
                    : Sizeconfig.screenheight! / 150,
            child: Image.asset(
              "lib/core/assets/images/homeimages/masjid_map.png",
              height: Sizeconfig.screenheight! / 4,
              fit: BoxFit.contain,
            ),
          ),

          //button for going to cart
          Positioned(
              bottom: Sizeconfig.screenheight! / 100,
              right: Sizeconfig.screenwidth! / 40,
              child: Card(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  onTap: () {},
                  child: SizedBox(
                    height: Sizeconfig.screenheight! < 768
                        ? Sizeconfig.screenheight! / 15
                        : Sizeconfig.screenheight! > 1010
                            ? Sizeconfig.screenheight! / 30
                            : Sizeconfig.screenheight! / 20,
                    width: Sizeconfig.screenwidth! / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: Sizeconfig.screenheight! < 768
                                ? Sizeconfig.screenheight! / 15
                                : Sizeconfig.screenheight! > 1010
                                    ? Sizeconfig.screenheight! / 30
                                    : Sizeconfig.screenheight! / 20,
                            width: Sizeconfig.screenwidth! / 3.5,
                            child: const Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                "find masjid",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
