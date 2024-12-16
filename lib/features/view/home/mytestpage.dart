import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:quranlife/features/controller/spalshview%20controller/splash_view_controller.dart';

final SplashViewController spctrl = Get.find();
final FetchPrayerFromDate fpfctrl = Get.find();

class Mytestpage extends StatelessWidget {
  const Mytestpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.toNamed("home");
            },
            icon: const Icon(Icons.home)),
        title: const Text("My Test Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("scheduled")),
              const Text("text: "),
            ],
          ),
        ),
      ),
    );
  }
}



// {
//    "2024-12-14":{
//       "code":200,
//       "status":"OK",
//       "data":{
//          "timings":{
//             "Fajr":"05":41,
//             "Sunrise":"07":15,
//             "Dhuhr":"12":03,
//             "Asr":"14":34,
//             "Sunset":"16":51,
//             "Maghrib":"16":51,
//             "Isha":"18":20,
//             "Imsak":"05":31,
//             "Midnight":"00":03,
//             "Firstthird":"21":39,
//             "Lastthird":"02":27
//          },
//          "date":{
//             "readable":14 Dec 2014,
//             "timestamp":1418569200,
//             "hijri":{
//                "date":21-02-1436,
//                "format":"DD-MM-YYYY",
//                "day":21,
//                "weekday":{
//                   "en":"Al Ahad",
//                   "ar":"الاحد"
//                },
//                "month":{
//                   "number":2,
//                   "en":"Ṣafar",
//                   "ar":"صَفَر"
//                },
//                "year":1436,
//                "designation":{
//                   "abbreviated":"AH",
//                   "expanded":"Anno Hegirae"
//                },
//                "holidays":[
                  
//                ]
//             },
//             "gregorian":{
//                "date":14-12-2014,
//                "format":"DD-MM-YYYY",
//                "day":14,
//                "weekday":{
//                   "en":"Sunday"
//                },
//                "month":{
//                   "number":12,
//                   "en":"December"
//                },
//                "year":2014,
//                "designation":{
//                   "abbreviated":"AD",
//                   "expanded":"Anno Domini"
//                }
//             }
//          },
//          "meta":{
//             "latitude":37.4219983,
//             "longitude":-122.084,
//             "timezone":"America/Los_Angeles",
//             "method":{
//                "id":19,
//                "name":"Algeria",
//                "params":{
//                   "Fajr":18,
//                   "Isha":17
//                },
//                "location":{
//                   "latitude":36.753768,
//                   "longitude":3.0587561
//                }
//             },
//             "latitudeAdjustmentMethod":"ANGLE_BASED",
//             "midnightMode":"STANDARD",
//             "school":"STANDARD",
//             "offset":{
//                "Imsak":0,
//                "Fajr":0,
//                "Sunrise":0,
//                "Dhuhr":0,
//                "Asr":0,
//                "Maghrib":0,
//                "Sunset":0,
//                "Isha":0,
//                "Midnight":0
//             }
//          }
//       }
//    }
// }