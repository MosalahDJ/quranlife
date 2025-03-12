// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project/features/controller/prayer%20times%20controller/fetch_prayer_from_date.dart';
import 'package:project/features/controller/prayer%20times%20controller/location_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

DateTime mycurrentdate = DateTime.now();

class GetResponseBody extends GetxController {
  final LocationController locationctrl = Get.find();
  late DateTime endDate;

  @override
  void onInit() {
    super.onInit();
    _updateDates();
    // Add periodic check for data refresh
    ever(_checkRefreshTimer, (_) => _checkAndRefresh());
  }

  final _checkRefreshTimer = 0.obs;

  // Start periodic check every hour
  void startPeriodicCheck() {
    Timer.periodic(const Duration(hours: 1), (timer) {
      _checkRefreshTimer.value = DateTime.now().millisecondsSinceEpoch;
    });
  }

  Future<void> _checkAndRefresh() async {
    if (await _isAfterRefreshingDate()) {
      _updateDates();
      await _gettingresponse(mycurrentdate, endDate);
      // Notify FetchPrayerFromDate to reload data
      Get.find<FetchPrayerFromDate>().loadPrayerData();
    }
  }

  void _updateDates() {
    mycurrentdate = DateTime.now();
    endDate = mycurrentdate.add(const Duration(days: 30));
  }

  late SharedPreferences prefs;
  String newRB = "";
  String responsebody = "";

  //these two func maded for add every date as key to his response
  String _addDateToResponse(String date, String newrb) {
    String result = '"$date":$newrb,';
    return result;
  }

  String _addDateToResponseWhitoutcomma(String date, String newrb) {
    String result = '"$date":$newrb';
    return result;
  }

  //this func maded for making date string as same as date in the url and make sure it's dynamic
  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  //I use this func for parsing String date when i get it from SHPF
  DateTime _parseDate(String date) {
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
  Future<void> _defineRefreshingDate() async {
    try {
      prefs = await SharedPreferences.getInstance();
      final refreshingdate = endDate.subtract(const Duration(days: 3));
      await prefs.setString("refreshingdate", _formatDate(refreshingdate));
    } catch (e) {
      print('Error setting refreshing date: $e');
    }
  }

  //checking if current date is after refreshing date
  Future<bool> _isAfterRefreshingDate() async {
    try {
      prefs = await SharedPreferences.getInstance();
      if (prefs.getString("refreshingdate") == null) {
        await _defineRefreshingDate();
        return false;
      }

      DateTime refreshingDate = _parseDate(prefs.getString("refreshingdate")!);
      DateTime now = DateTime.now();

      // Check if we've passed the refresh date
      if (now.isAfter(refreshingDate)) {
        await prefs.remove("refreshingdate");
        return true;
      }
      return false;
    } catch (e) {
      print('Error checking refresh date: $e');
      return false;
    }
  }

  Future<bool> _shouldRefreshData() async {
    try {
      prefs = await SharedPreferences.getInstance();
      if (prefs.getString("responsebody") == null) return true;

      if (prefs.getString("responsebody")!.length < 36000) return true;

      Map<String, dynamic> data = jsonDecode(prefs.getString("responsebody")!);
      List<String> dates = data.keys.toList();
      if (dates.isEmpty) return true;

      dates.sort();
      DateTime oldestStoredDate = _parseDate(dates.first);
      DateTime latestStoredDate = _parseDate(dates.last);
      DateTime currentDate = DateTime.now();

      // Check if current date is within our stored date range
      if (currentDate.isBefore(oldestStoredDate) ||
          currentDate.isAfter(latestStoredDate)) {
        return true;
      }

      return false; // Don't refresh if we have valid data
    } catch (e) {
      print('Error checking data validity: $e');
      return true;
    }
  }

  //i use this func when open the app
  Future<bool> initileresponse() async {
    prefs = await SharedPreferences.getInstance();
    bool needsRefresh = await _shouldRefreshData();

    if (needsRefresh) {
      _updateDates();
      Get.snackbar(
        "downloading_data".tr,
        "please_be_patient".tr,
        colorText:
            Get.isDarkMode
                ? const Color(0xFFFFFFFF)
                : const Color.fromARGB(255, 0, 0, 0),
        duration: const Duration(seconds: 15),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        padding: const EdgeInsets.all(20),
      );
      await _gettingresponse(mycurrentdate, endDate);
      return true; // Data was refreshed
    }
    return false; // No refresh needed
  }

  //I use this func on demende
  demendeNewResponse() async {
    prefs = await SharedPreferences.getInstance();
    await _gettingresponse(mycurrentdate, endDate);
  }

  Future<void> _gettingresponse(
    DateTime mycurrentdate,
    DateTime endDate,
  ) async {
    await locationctrl.determinePosition();
    //day before last day
    DateTime dayBeforEndDate = endDate.subtract(const Duration(days: 1));
    try {
      String tempResponseBody = "";

      while (mycurrentdate.isBefore(endDate)) {
        //I add this var for passing it as date in url
        String formattedDate = _formatDate(mycurrentdate);

        //getting response
        var response = await http.get(
          Uri.parse(
            "https://api.aladhan.com/v1/timings/$formattedDate?latitude=${locationctrl.latitude}&longitude=${locationctrl.longtude}&method=19",
          ),
        );
        //if succes store responsebody in cash
        if (response.statusCode == 200) {
          //check if we are in dayBeforEndDate for passing data corectly without
          //comma in last of responsebody
          newRB =
              mycurrentdate == dayBeforEndDate
                  ? _addDateToResponseWhitoutcomma(formattedDate, response.body)
                  : _addDateToResponse(formattedDate, response.body);
          tempResponseBody += newRB;
        }
        // shift to the next day
        mycurrentdate = mycurrentdate.add(const Duration(days: 1));
      }

      // Save all data at once
      await prefs.setString("responsebody", "{$tempResponseBody}");

      // Update the refreshing date
      await _defineRefreshingDate();

      // Notify FetchPrayerFromDate to reload data instead of restarting
      Get.find<FetchPrayerFromDate>().loadPrayerData();
    } catch (e) {
      print('There was an error: $e');
    }
  }
}
