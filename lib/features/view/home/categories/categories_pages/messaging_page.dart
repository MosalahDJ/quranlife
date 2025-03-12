import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/features/controller/fcm%20controllers/messaging_controller.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessagingController());

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
      body: Stack(
        children: [
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
                  'lib/core/assets/images/background_image/arch.jpg',
                ),
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
                    stream: controller.messagesStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('error_occurred'.tr));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        controller.scrollToBottom();
                      });

                      return ListView.builder(
                        controller: controller.scrollController,
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var message = snapshot.data!.docs[index];
                          bool isCurrentUser = controller.isCurrentUserSender(
                            message['senderId'],
                          );

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment:
                                  isCurrentUser
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
                                      color:
                                          isCurrentUser
                                              ? Colors.blue[100]
                                              : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          !isCurrentUser
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message['senderName'] ?? 'user'.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color:
                                                Get.isDarkMode
                                                    ? kmaincolor4
                                                    : kmaincolor,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          message['text'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black.withValues(
                                              alpha: 0.8,
                                            ),
                                          ),
                                        ),
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
                _buildMessageInput(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(DocumentSnapshot message) {
    return CircleAvatar(
      radius: 20,
      backgroundImage:
          message['senderPhotoUrl'] != null
              ? NetworkImage(message['senderPhotoUrl'])
              : null,
      child:
          message['senderPhotoUrl'] == null ? const Icon(Icons.person) : null,
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    final MessagingController controller = Get.find();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.8),
                fontSize: 16,
              ),
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: 'write_message'.tr,
                hintStyle: TextStyle(
                  color: Colors.black.withValues(alpha: 0.5),
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
              onPressed: () => controller.sendMessage(context),
            ),
          ),
        ],
      ),
    );
  }
}
