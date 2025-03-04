import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import '../../../../../features/controller/ai chat controller/ai_chat_controller.dart';

class AiBotPage extends StatelessWidget {
  final AiChatController controller = Get.put(AiChatController());

  AiBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المساعد الذكي',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Obx(() => ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ChatBubble(
                          clipper: message.isUser
                              ? ChatBubbleClipper6(type: BubbleType.sendBubble)
                              : ChatBubbleClipper6(
                                  type: BubbleType.receiverBubble),
                          alignment: message.isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 8),
                          backGroundColor:
                              message.isUser ? Colors.blue : Colors.grey[300],
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Text(
                              message.content,
                              style: TextStyle(
                                color: message.isUser
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ),
          Obx(() => controller.isLoading.value
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink()),
          Obx(() => controller.errorMessage.value.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink()),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageController,
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    textDirection: TextDirection.rtl,
                    onSubmitted: (_) => controller.sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: controller.sendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
