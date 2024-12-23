// ignore_for_file: avoid_print
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:quranlife/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

DateTime mycurrentdate = DateTime.now();
DateTime endDate = mycurrentdate.add(const Duration(days: 4));

class GetResponseBody extends GetxController {
  final LocationController locationctrl = Get.find();
  late SharedPreferences prefs;
  String newRB = "";
  String? responsebody;

  //these two func maded for add every date as key to his response
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

  String formatDateString(String date) {
    List parts = date.split("-");
    return "${parts[0]}-${parts[1].toString().padLeft(2, '0')}-${parts[2].toString().padLeft(2, '0')}";
  }

  //I use this func for parsing String date when i get it from SHPF
  DateTime parseTime(String date) {
    try {
      var parts = date.trim().split('-');
      if (parts.length != 3) {
        throw FormatException('Invalid time format: $date');
      }
      return DateTime(
        int.parse(parts[0].trim()),
        int.parse(parts[1].trim()),
        int.parse(parts[2].trim()),
      );
    } catch (e) {
      print('Error parsing time: $date - Error: $e');
      // Return a default time in case of error
      return DateTime.now();
    }
  }

  //I use this func for defining end date and refreshing date
  Future<void> defineRefreshingDate() async {
    try {
      prefs = await SharedPreferences.getInstance();
      final refreshingdate = endDate.subtract(const Duration(days: 3));
      await prefs.setString("refreshingdate", formatDate(refreshingdate));
    } catch (e) {
      print('Error setting refreshing date: $e');
    }
  }

  //checking if current date is after refreshing date
  Future<bool> isAfterRefreshingDate() async {
    prefs = await SharedPreferences.getInstance();
    DateTime refreshingDate;
    //checking if it has a null value
    if (prefs.getString("refreshingdate") == null) {
      //get it's value
      await defineRefreshingDate();
      String rfdate = prefs.getString("refreshingdate")!;
      refreshingDate = parseTime(rfdate);
    } else {
      refreshingDate = parseTime(prefs.getString("refreshingdate")!);
    }
    // check if currentdate is after refreshingdate
    if (mycurrentdate.isAfter(refreshingDate)) {
      return true;
    } else {
      return false;
    }
  }

  //i use this func when open the app
  initileresponse() async {
    prefs = await SharedPreferences.getInstance();
    //I add it here to ensure it's updated
    //select last day of data
    if (prefs.getString("responsebody") == null ||
        // prefs.getString("responsebody")!.length < 220000 ||
        await isAfterRefreshingDate()) {
      Get.snackbar("Downloading Data...",
          "Please be pationet it take's a while at first time",
          duration: const Duration(
            seconds: 15,
          ),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          padding: const EdgeInsets.all(20));
      await gettingresponse(mycurrentdate, endDate);
      //I use this methode for restart app for making sure data is ready
      Restart.restartApp();
    } else {
      null;
    }
  }

  //I use this func on demende
  demendeNewResponse() async {
    prefs = await SharedPreferences.getInstance();
    await gettingresponse(mycurrentdate, endDate);
  }

  Future<void> gettingresponse(
    DateTime mycurrentdate,
    DateTime endDate,
  ) async {
    await locationctrl.determinePosition();
    //day before last day
    DateTime dayBeforEndDate = endDate.subtract(const Duration(days: 1));
    try {
      //I remove the old data from responsebody to ensure data will not merged inside it
      await prefs.remove("responsebody");
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
          responsebody = await prefs.getString("responsebody");
        }
        // shift to the next day
        mycurrentdate = mycurrentdate.add(const Duration(days: 1));
      }
      // add curlyBraces to response body
      await prefs.setString("responsebody", "{$responsebody}");
    } catch (e) {
      print('There was an error: $e');
    }
  }
}
