import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/core/Utils/size_config.dart';
import 'package:project/core/widgets/gradient_background.dart';
import 'package:project/core/widgets/shimmer_text.dart';
import 'package:project/core/widgets/skeletonizer.dart';
import '../../../../../features/controller/ai chat controller/ai_chat_controller.dart';

class AiBotPage extends StatelessWidget {
  const AiBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AiChatController controller = Get.put(AiChatController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShimmerText(
          text: 'ai_bot'.tr,
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
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Obx(
                      () => ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final message = controller.messages[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ChatBubble(
                              clipper:
                                  message.isUser
                                      ? ChatBubbleClipper6(
                                        type: BubbleType.sendBubble,
                                      )
                                      : ChatBubbleClipper6(
                                        type: BubbleType.receiverBubble,
                                      ),
                              alignment:
                                  message.isUser
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 8),
                              backGroundColor:
                                  message.isUser
                                      ? Colors.blue
                                      : Colors.grey[300],
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Text(
                                  message.content,
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                    color:
                                        message.isUser
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
                      ),
                    ),
                  ),
                ),
                Obx(
                  () =>
                      controller.isLoading.value
                          ? _buildSkeletonLayout(context)
                          : const SizedBox.shrink(),
                ),
                _buildMessageInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSkeletonLayout(context) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Myskeletonizer(
            skeletonizerWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ChatBubble(
                  clipper: ChatBubbleClipper6(type: BubbleType.receiverBubble),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 8),
                  backGroundColor: Colors.grey[300],
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: const Text(
                      "texttexttexttexttexttexttexttexttexttexttexttexttexttexttetexttexttexttexttexttexttextextextexttext",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMessageInput() {
  final AiChatController controller = Get.find();

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
            onPressed: controller.sendMessage,
          ),
        ),
      ],
    ),
  );
}
