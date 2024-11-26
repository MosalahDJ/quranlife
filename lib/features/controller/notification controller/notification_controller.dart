// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranlife/features/controller/notification%20controller/my_acces_token.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    requestnotificationpermission();
    adhansubscribition.value == true
        ? subscribetotopic("Adhan")
        : unsbscribefrometopic("Adhan");
    adhkarsubscribition.value == true
        ? subscribetotopic("Adhkar")
        : unsbscribefrometopic("Adhkar");
    quraansubscribition.value == true
        ? subscribetotopic("Quraan")
        : unsbscribefrometopic("Quraan");
    onmessage();
    setupInteractedMessage();
    super.onInit();
  }

  final AccesToken acctokenctrl = Get.find();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  sendmessage(topicname, mytitle, mybody, mytype) async {
    var mytoken = await acctokenctrl.getAccestoken();

    var headerslist = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var url = Uri.parse(
        "https://fcm.googleapis.com/v1/projects/quraanlife-50941/messages:send");

    var body = {
      "message": {
        "topic": topicname,
        "notification": {"title": mytitle, "body": mybody},
        "data": {"type": mytype}
      }
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headerslist);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    if (res.statusCode >= 200 && res.statusCode < 300) {
      print("succes sent :$resBody");
    } else {
      print(res.reasonPhrase);
    }
  }

  //permission
  requestnotificationpermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  RxBool adhansubscribition = true.obs;
  RxBool adhkarsubscribition = true.obs;
  RxBool quraansubscribition = true.obs;

  onchangesubscribtion(bool value, String topicname) {
    value == false
        ? subscribetotopic(topicname)
        : unsbscribefrometopic(topicname);
    update();
  }

  //subscribe to topic
  subscribetotopic(String topicname) async {
    await FirebaseMessaging.instance.subscribeToTopic(topicname);
    print("subscribed");
  }

  //unsbscribe frome topic
  unsbscribefrometopic(String topicname) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topicname);
    print("unsubscribed");
  }

  //handle notification on message
  onmessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null && message.data["type"] == "adhan") {
        Get.snackbar(message.notification!.title!, message.notification!.body!);
      } else if (message.notification != null &&
          message.data["type"] == "quraan") {
        Get.snackbar(message.notification!.title!, message.notification!.body!);
      } else {
        Get.snackbar(message.notification!.title!, message.notification!.body!);
      }
    });
  }

  //handling interaction with notification
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    void handleMessage(RemoteMessage message) {
      if (message.data['type'] == 'adhan') {
        Get.toNamed("/salattime");
      } else if (message.data['type'] == 'quraan') {
        Get.toNamed("/quraan");
      } else {
        Get.toNamed("/adkar");
      }
    }

    // If the message also contains a data property with a "type" of "adhan",
    // navigate to a salattime screen
    if (initialMessage != null) {
      handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  // Volume control functions
  RxBool fajrvolum = false.obs;
  RxBool sunrizevolum = false.obs;
  RxBool duhrvolum = false.obs;
  RxBool asrvolum = false.obs;
  RxBool maghribvolum = false.obs;
  RxBool ishavolum = false.obs;

  volumfunc(RxBool volum) {
    volum.value = !volum.value;
    update();
  }
}
