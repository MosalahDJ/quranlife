import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';
import 'package:quranlife/features/controller/fcm%20controllers/fcm_controller.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final TextEditingController _messageController = TextEditingController();
  final FCMController _fcmController = Get.find();
  final ScrollController _scrollController = ScrollController();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: ShimmerText(
            text: 'community'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(children: [
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/core/assets/images/background_image/arch.jpg'),
                opacity: 0.1,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('messages')
                        .orderBy('timestamp', descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('error_occurred'.tr));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _scrollToBottom();
                      });

                      return ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var message = snapshot.data!.docs[index];
                          bool isCurrentUser =
                              message['senderId'] == currentUser?.uid;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: isCurrentUser
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                if (isCurrentUser) _buildUserAvatar(message),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: EdgeInsets.only(
                                      left: isCurrentUser ? 8 : 10,
                                      right: isCurrentUser ? 10 : 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isCurrentUser
                                          ? Colors.blue[100]
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: !isCurrentUser
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message['senderName'] ?? 'user'.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Get.isDarkMode
                                                ? kmaincolor4
                                                : kmaincolor,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(message['text'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                if (!isCurrentUser) _buildUserAvatar(message),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                _buildMessageInput(),
              ],
            ),
          )
        ]));
  }

  Widget _buildUserAvatar(DocumentSnapshot message) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: message['senderPhotoUrl'] != null
          ? NetworkImage(message['senderPhotoUrl'])
          : null,
      child:
          message['senderPhotoUrl'] == null ? const Icon(Icons.person) : null,
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'write_message'.tr,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 25,
            backgroundColor: Get.isDarkMode ? kmaincolor4 : kmaincolor,
            child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: _sendMessage),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'text': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'senderId': currentUser?.uid,
        'senderName': currentUser?.displayName,
        'senderEmail': currentUser?.email,
        'senderPhotoUrl': currentUser?.photoURL,
      });

      // Send FCM notification
      _fcmController.sendmessage(
        'chat',
        currentUser?.displayName ?? 'user'.tr,
        _messageController.text,
        'chat',
      );

      _messageController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } catch (e) {
      // print('Error sending message: $e');
      Get.snackbar('error'.tr, 'send_failed'.tr);
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
