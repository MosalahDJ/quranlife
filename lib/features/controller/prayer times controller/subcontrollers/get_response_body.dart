// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/subcontrollers/location_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetResponseBody extends GetxController {
  final LocationController locationctrl = Get.find();
  late SharedPreferences prefs;
  String newRB = "";
  String? responsebody;

  String addDateToResponse(String date, String newrb) {
    String result = '"$date":$newrb,';
    return result;
  }

  String addDateToResponseWhitoutcomma(String date, String newrb) {
    String result = '"$date":$newrb';
    return result;
  }

  //this func maded for making date string as same as date in the url and make sure it's dynamic
  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<String> gettingresponse() async {
    prefs = await SharedPreferences.getInstance();
    //I add it here to ensure ir's updated
    DateTime mycurrentdate = DateTime.now();
    try {
      //I remove the old data from responsebody to ensure data will not merged inside it
      await prefs.remove("responsebody");
      //select last day of data
      DateTime endDate = mycurrentdate.add(const Duration(days: 2));
      //day before last day
      DateTime dayBeforEndDate = endDate.subtract(const Duration(days: 1));
      while (mycurrentdate.isBefore(endDate)) {
        //I add this var for passing it as date in url
        String formattedDate = formatDate(mycurrentdate);

        //getting response
        var response = await http.get(Uri.parse(
            "https://api.aladhan.com/v1/timings/$formattedDate?latitude=${locationctrl.latitude}&longitude=${locationctrl.longtude}&method=19"));

        //if succes store responsebody in cash
        if (response.statusCode == 200) {
          //check if we are in dayBeforEndDate for passing data corectly without
          //comma in last of responsebody
          newRB = mycurrentdate == dayBeforEndDate
              ? addDateToResponseWhitoutcomma(formattedDate, response.body)
              : addDateToResponse(formattedDate, response.body);
          //add the new response body of new date to current responsebody
          await prefs.setString("responsebody", "${responsebody ?? ""}$newRB");
          // getting data from cash to this var
          responsebody = prefs.getString("responsebody");
        }
        // shift to the next day
        mycurrentdate = mycurrentdate.add(const Duration(days: 1));
      }
      // add curlyBraces to response body
      responsebody = "{$responsebody}";
      Map<dynamic, dynamic> myresponsebody = jsonDecode(responsebody!);
      List rbkeys = [];
      rbkeys.addAll(myresponsebody.keys);

      log("$rbkeys");
      return "$responsebody";
    } catch (e) {
      print('There was an error: $e');
      return "null";
    }
  }
}
