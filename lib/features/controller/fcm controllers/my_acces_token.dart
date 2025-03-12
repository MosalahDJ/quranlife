// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as myauth;

class AccesToken {
  Future<String> getAccestoken() async {
    try {
      //here i get the serviceaccount from .env file
      //i use .env for make serviceaccount safe when i push project on github
      final String serviceaccountJsonString = dotenv.env['serviceaccountjson']!;

      //convert string to map
      final Map<String, dynamic> serviceaccountJson =
          jsonDecode(serviceaccountJsonString);

      List<String> scopes = [
        // "https://www.googleapis.com/auth/userinfo.email",
        // "https://www.googleapis.com/auth/firebase.database",
        "https://www.googleapis.com/auth/firebase.messaging",
      ];

      //getting ServiceAccountCredentials
      final credentials =
          myauth.ServiceAccountCredentials.fromJson(serviceaccountJson);

      //define client
      http.Client client =
          await myauth.clientViaServiceAccount(credentials, scopes);

      //define access credential
      myauth.AccessCredentials accessCredentials =
          await myauth.obtainAccessCredentialsViaServiceAccount(
              credentials, scopes, client);

      client.close();

      return accessCredentials.accessToken.data;
    } catch (e) {
      print("can't get Access Token: $e");
      return "";
    }
  }
}
