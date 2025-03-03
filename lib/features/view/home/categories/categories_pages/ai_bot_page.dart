import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import '../../../../../features/controller/ai chat controller/Ai_chat_controller.dart';

class Message {
  final String content;
  final bool isUser;
  Message(this.content, this.isUser);
}

class AiBotPage extends StatefulWidget {
  const AiBotPage({super.key});

  @override
  State<AiBotPage> createState() => _AiBotPageState();
}

class _AiBotPageState extends State<AiBotPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];
  final AIChatService _chatService = Get.put(AIChatService());

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = _messageController.text;
    setState(() {
      _messages.add(Message(userMessage, true));
      _chatService.isLoading.value = true;
    });

    _messageController.clear();
    _scrollToBottom();

    try {
      final response = await AIChatService.sendMessage(userMessage);
      setState(() {
        _messages.add(Message(response, false));
      });
    } catch (e) {
      setState(() {
        _messages.add(Message("عذراً، حدث خطأ في الاتصال", false));
      });
    } finally {
      setState(() {
        _chatService.isLoading.value = false;
      });
      _scrollToBottom();
    }
  }

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
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ChatBubble(
                      clipper: message.isUser
                          ? ChatBubbleClipper6(type: BubbleType.sendBubble)
                          : ChatBubbleClipper6(type: BubbleType.receiverBubble),
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
                            color: message.isUser ? Colors.white : Colors.black,
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
          Obx(() => _chatService.isLoading.value
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink()),
          if (_chatService.errorMessage.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _chatService.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            ),
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
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    textDirection: TextDirection.rtl,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
