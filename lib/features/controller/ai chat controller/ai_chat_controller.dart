import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Message {
  final String content;
  final bool isUser;
  Message(this.content, this.isUser);
}

class AiChatController extends GetxController {
  static final String _apiKey = dotenv.env['OPENROUTER_API_KEY']!;
  static const String _modelUrl = "https://openrouter.ai/api/v1";

  final messageController = TextEditingController();
  final scrollController = ScrollController();
  final RxList<Message> messages = <Message>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    final userMessage = messageController.text;
    messages.add(Message(userMessage, true));
    isLoading.value = true;

    messageController.clear();
    scrollToBottom();

    try {
      final response = await chatWithAI(userMessage);
      messages.add(Message(response, false));
    } catch (e) {
      messages.add(Message("عذراً، حدث خطأ في الاتصال", false));
    } finally {
      isLoading.value = false;
      scrollToBottom();
    }
  }

  String cleanText(String text) {
    return text
        .replaceAll(r'\n', '\n') // تحويل نص السطر الجديد إلى سطر جديد فعلي
        .replaceAll(RegExp(r'<s>\[INST\].*?\[/INST\]'), '')
        .replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), '')
        .trim();
  }

  Future<String> chatWithAI(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json; charset=UTF-8",
          "HTTP-Accept": "application/json",
        },
        body: jsonEncode({
          "model": "deepseek/deepseek-r1:free",
          "messages": [
            {
              "role": "system",
              "content":
                  "You are a helpful assistant. Please respond in Arabic language only."
            },
            {"role": "user", "content": userMessage}
          ],
          "temperature": 0.7,
          "max_tokens": 500
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        String generatedText = data["choices"][0]["message"]["content"];
        return cleanText(generatedText); // استخدام دالة التنظيف الجديدة
      } else if (response.statusCode == 503) {
        return "النموذج قيد التحميل، يرجى المحاولة مرة أخرى بعد قليل.";
      } else {
        return "عذراً، حدث خطأ في الاتصال (${response.statusCode})";
      }
    } catch (e) {
      return "حدث خطأ غير متوقع: $e";
    }
  }

  Future<void> checkModelStatus() async {
    try {
      final response = await http.get(
        Uri.parse(_modelUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
        },
      );

      if (response.statusCode != 200) {
        errorMessage.value = 'النموذج غير متاح حالياً';
      }
    } catch (e) {
      errorMessage.value = 'خطأ في الاتصال بالخادم';
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkModelStatus();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
