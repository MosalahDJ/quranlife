import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Txtvalcontroller extends GetxController {
  //Signe in form state
  GlobalKey<FormState> signinemailstate = GlobalKey<FormState>();
  GlobalKey<FormState> signinpasswordstate = GlobalKey<FormState>();
  GlobalKey<FormState> signinpasswordstate2 = GlobalKey<FormState>();
  GlobalKey<FormState> signinnamestate = GlobalKey<FormState>();
  GlobalKey<FormState> signinlastnamestate = GlobalKey<FormState>();
  GlobalKey<FormState> signingendrestate = GlobalKey<FormState>();

  //Login form state
  GlobalKey<FormState> loginemailstate = GlobalKey<FormState>();
  GlobalKey<FormState> loginpasswordstate = GlobalKey<FormState>();
  GlobalKey<FormState> loginpasswordstate2 = GlobalKey<FormState>();
}
