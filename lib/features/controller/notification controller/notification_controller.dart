// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranlife/features/controller/notification%20controller/acces_token.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    requestnotificationpermission();
    onmessage();
    setupInteractedMessage();
    super.onInit();
  }

  final AccesToken acctokenctrl = Get.find();

  sendmessage(topicname, mytitle, mybody, mytype) async {
    var headerslist = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${acctokenctrl.getAccestoken()}',
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

  FirebaseMessaging messaging = FirebaseMessaging.instance;

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

  subscribetotopic(String topicname) async {
    await FirebaseMessaging.instance.subscribeToTopic(topicname);
    print("subscribed");
  }

  unsbscribefrometopic(String topicname) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topicname);
    print("unsubscribed");
  }

  onmessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    void handleMessage(RemoteMessage message) {
      if (message.data['type'] == 'chat') {}
    }

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
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
