// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PreferencesController extends GetxController {
//   late SharedPreferences prefs;

//   @override
//   void onInit() async {
//     super.onInit();
//     prefs = await SharedPreferences.getInstance();
//   }

//   //setting data
//   void saveStringData(String key, dynamic value) {
//     prefs.setString(key, value);
//   }

//   void saveBoolData(String key, dynamic value) {
//     prefs.setBool(key, value);
//   }

//   void savedoubleData(String key, dynamic value) {
//     prefs.setDouble(key, value);
//   }

//   void saveIntData(String key, dynamic value) {
//     prefs.setInt(key, value);
//   }

//   void saveStringListData(String key, dynamic value) {
//     prefs.setStringList(key, value);
//   }

//   //Getting data
//   String getString(
//     String key,
//   ) {
//     return prefs.getString(key)!;
//   }

//   bool getBool(
//     String key,
//   ) {
//     return prefs.getBool(key)!;
//   }

//   double getdouble(
//     String key,
//   ) {
//     return prefs.getDouble(key)!;
//   }

//   int getInt(
//     String key,
//   ) {
//     return prefs.getInt(key)!;
//   }

//   List<String> getStringList(
//     String key,
//   ) {
//     return prefs.getStringList(key)!;
//   }

//   //remove data
//   void removeData(
//     String key,
//   ) {
//     prefs.remove(key);
//   }
// }
