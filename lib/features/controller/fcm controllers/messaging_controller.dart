import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';

class MessagingController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FCMController fcmController = Get.find();
  final currentUser = FirebaseAuth.instance.currentUser;

  // Stream للرسائل
  Stream<QuerySnapshot> get messagesStream => FirebaseFirestore.instance
      .collection('messages')
      .orderBy('timestamp', descending: false)
      .snapshots();

  // إرسال رسالة
  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'text': messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'senderId': currentUser?.uid,
        'senderName': currentUser?.displayName,
        'senderEmail': currentUser?.email,
        'senderPhotoUrl': currentUser?.photoURL,
      });

      // إرسال إشعار FCM
      fcmController.sendmessage(
        'chat',
        currentUser?.displayName ?? 'user'.tr,
        messageController.text,
        'chat',
      );

      messageController.clear();
      scrollToBottom();
    } catch (e) {
      Get.snackbar('error'.tr, 'send_failed'.tr);
    }
  }

  // التمرير إلى أسفل القائمة
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // التحقق مما إذا كان المستخدم الحالي هو مرسل الرسالة
  bool isCurrentUserSender(String senderId) {
    return senderId == currentUser?.uid;
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
