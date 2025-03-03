import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

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
  bool _isLoading = false;

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(_messageController.text, true));
      _isLoading = true;
    });

    String userMessage = _messageController.text;
    _messageController.clear();
    _scrollToBottom();

    // TODO: Implement Hugging Face API call here
    // Placeholder response
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _messages.add(Message("سيتم تنفيذ الاتصال بـ Mistral-7B قريباً", false));
      _isLoading = false;
    });
    _scrollToBottom();
  }

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
                  return ChatBubble(
                    clipper: message.isUser
                        ? ChatBubbleClipper6(type: BubbleType.sendBubble)
                        : ChatBubbleClipper6(type: BubbleType.receiverBubble),
                    alignment:
                        message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 20),
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
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
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
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
}