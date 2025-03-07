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

  static const _systemPrompt = """
أنت مساعد ذكي في تطبيق قرآن لايف، مهمتك الرئيسية هي:
- الإجابة على الأسئلة الإسلامية ضمن نطاق القرآن والسنة
- مساعدة المستخدمين في الفتاوى الشرعية الموثقة
- شرح الأحكام الفقهية بالمصادر المعتمدة

القواعد الأساسية:
1. عند السؤال عن هويتك:
   "أنا مساعد ذكي في تطبيق قرآن لايف مخصص لخدمة الإسلام والمسلمين"

2. إذا طرح سؤال خارج الإسلام:
   "عذرًا، هذا التطبيق مخصص للأسئلة الإسلامية فقط. كيف يمكنني مساعدتك في موضوع شرعي؟"

3. منهجية الإجابة:
   - اذكر الدليل من القرآن (السورة والآية)
   - استشهد بالأحاديث الصحيحة مع المصدر
   - اعتمد على المذاهب الأربعة في المسائل الخلافية
   - استخدم لغة عربية واضحة وسهلة

4. في الأسئلة الحساسة:
   "ينبغي الرجوع إلى عالم شرعي متخصص لهذه المسائل"
""";

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
    final userMessage = messageController.text.trim();
    if (userMessage.isEmpty) return;

    messages.add(Message(userMessage, true));
    isLoading.value = true;
    messageController.clear();
    scrollToBottom();

    try {
      final response = await chatWithAI(userMessage);
      messages.add(Message(response, false));
    } catch (e) {
      messages.add(Message("error_connection".tr, false));
    } finally {
      isLoading.value = false;
      scrollToBottom();
    }
  }

  String cleanText(String text) {
    return text
        .replaceAll(r'\n', '\n')
        .replaceAll(RegExp(r'<s>\[INST\].*?\[/INST\]'), '')
        .replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), '')
        .replaceAllMapped(
          RegExp(r'\[المصدر:(.*?)\]'),
          (match) => '\n\n[المصدر: ${match.group(1)}]',
        )
        .trim();
  }

  Future<String> chatWithAI(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({
          "model": "deepseek/deepseek-r1:free",
          "messages": [
            {"role": "system", "content": _systemPrompt},
            {"role": "user", "content": userMessage}
          ],
          "temperature": 0.3,
          "max_tokens": 600,
          "frequency_penalty": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        String generatedText = data["choices"][0]["message"]["content"];
        return cleanText(generatedText);
      }
      return "${'connection_error'.tr} (${response.statusCode})";
    } catch (e) {
      return "${'connection_error'.tr} $e";
    }
  }

  Future<void> checkModelStatus() async {
    try {
      final response = await http.get(
        Uri.parse(_modelUrl),
        headers: {'Authorization': 'Bearer $_apiKey'},
      );

      if (response.statusCode != 200) {
        errorMessage.value = 'model_unavailable'.tr;
      }
    } catch (e) {
      errorMessage.value = 'server_error'.tr;
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
